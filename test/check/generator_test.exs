defmodule Check.GeneratorTest do
  use Check.Case, async: false
  use ExCheck

  alias Check.Generator

  property "integer generates integers" do
    for_all _ in int do
      Generator.integer |> is_integer
    end
  end

  property "integer has a max" do
    for_all {min, max} in {pos_integer, pos_integer} do
      min = -min
      num = Generator.integer( min, max )
      num <= max
    end
  end

  property "integer has a min" do
    for_all {min, max} in {pos_integer, pos_integer} do
      min = -min
      num = Generator.integer( min, max )
      num > min
    end
  end
end
