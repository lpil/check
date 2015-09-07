defmodule Check.Domain.IntegerTest do
  use Check.Case, async: false
  use ExCheck

  alias Check.Domain.Integer

  property "any generates integers" do
    for_all _ in int do
      Integer.any |> is_integer
    end
  end

  property "any has a max" do
    for_all {min, max} in {pos_integer, pos_integer} do
      min = -min
      num = Integer.any( min, max )
      num <= max
    end
  end

  property "any has a min" do
    for_all {min, max} in {pos_integer, pos_integer} do
      min = -min
      num = Integer.any( min, max )
      num > min
    end
  end

  property "shrink stabilises at 0" do
    for_all num in int do
      CheckTest.minify( &Integer.shrink/1, num ) == 0
    end
  end
end
