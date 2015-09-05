defmodule Check.Generator do
  @moduledoc """
  Functions that generate random(ish) data.
  """

  @integer_limit 1_152_921_504_606_846_975

  @doc """
  Generates a random integer between an optional max and min value.
  """
  def integer(min \\ -@integer_limit, max \\ @integer_limit)
  when is_integer(max) and is_integer(min) and max > min do
    diff = max - min
    :random.uniform(diff) + min
  end
end
