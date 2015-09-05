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

  check "that we can assign variables", for [x: integer] do
    assert is_integer x
  end

  # check "that we can assign multiple variables", for [x in int, y in int] do
  #   assert x == "x"
  # end
end
