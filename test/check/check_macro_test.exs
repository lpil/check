defmodule Check.CheckMacroTest do
  use Check.Case

  setup do
    {:ok, [value: :ok]}
  end

  check "that the check macro compiles" do
    assert 1 == 1
  end

  check "that it can accept a context", context do
    assert context.value == :ok
  end
end
