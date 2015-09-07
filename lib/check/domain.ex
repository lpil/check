defmodule Check.Domain do
  @moduledoc """
  Domains are responsible for the generation and shrinking of values.
  """

  defstruct type:      nil,
            generator: nil,
            shrinkers: []

  alias Check.Domain

  def integer do
    %Domain{
      type:      :integer,
      generator: &Domain.Integer.any/0,
      shrinkers: [] # TODO
    }
  end
end
