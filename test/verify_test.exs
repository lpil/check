defmodule VerifyTest do
  use ExUnit.Case

  def inc(x) do
    x + 1
  end

  given x in int, "inc increases by one" do
    assert inc(x) == x + 1
  end

  verify "inc increases by one" when x in int do
    assert inc(x) == x + 1
  end
end
