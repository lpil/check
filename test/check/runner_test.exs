defmodule Check.RunnerTest do
  use Check.Case

  alias Check.Domain
  alias Check.Runner

  import ExUnit.CaptureIO

  check "test evalutes given AST" do
    ast = quote do IO.puts "Hello, world!" end
    out = capture_io fn ->
      Runner.test( ast, __MODULE__, [] )
    end
    assert String.contains?( out, "Hello, world!" )
  end

  check "test evaluates the given AST multiple times" do
    ast = quote do IO.write "Ω" end
    expected = String.duplicate "Ω", 100
    out = capture_io fn ->
      Runner.test( ast, __MODULE__, [] )
    end
    assert out == expected
  end

  check "assertion exceptions bubble up" do
    ast = quote do assert false end
    assert_raise ExUnit.AssertionError, "Expected truthy, got false", fn ->
      Runner.test( ast, __MODULE__, [] )
    end
  end

  check "test prepends variable assignments" do
    ast = quote do
      import ExUnit.Assertions
      assert x == 1
    end
    domain = %Domain{ generator: fn -> 1 end }
    assignments = [x: domain]
    Runner.test( ast, __MODULE__, assignments )
  end
end
