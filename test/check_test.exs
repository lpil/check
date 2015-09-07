defmodule CheckTest do
  use Check.Case

  @doc """
  Shrinks the given value until it can shrink no more.
  """
  def minify(fun, x) do
    minify(fun, fun.(x), x)
  end

  defp minify(_, x, x) do
    x
  end
  defp minify(fun, x, _prev) do
    minify(fun, fun.(x), x)
  end

  check "minify returns the val when both versions are equal" do
    fun = fn _ -> flunk "Shrinker should not run" end
    minify(fun, 1, 1)
  end

  check "minify uses the shrinker when they are not" do
    fun = fn _ -> 1 end
    minify(fun, 1, nil)
  end
end
