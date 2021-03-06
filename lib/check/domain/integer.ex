defmodule Check.Domain.Integer do
  @moduledoc """
  The domain of integers.
  """

  @min -1_000_000_000_000
  @max  1_000_000_000_000

  def shrink(n) when n > 0 do n - 1 end
  def shrink(n) when n < 0 do n + 1 end
  def shrink(n)            do n     end

  @doc """
  Generates a random integer between an optional max and min value.
  """
  def any(min \\ @min, max \\ @max)
  when is_integer(max) and is_integer(min) and max > min do
    diff = max - min
    :random.uniform(diff) + min
  end
end
