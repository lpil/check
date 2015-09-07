defmodule Check.Domain do
  @moduledoc """
  Domains are responsible for the generation and shrinking of values.
  """

  defstruct kind:      nil,
            generator: nil,
            shrinkers: []
end
