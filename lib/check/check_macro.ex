defmodule Check.CheckMacro do
  @moduledoc """
  Defines the `check` macro used in our test cases.
  """

  defmacro check(desc, [do: body]) do
    quote do
      test unquote(desc), do: unquote(body)
    end
  end

  defmacro check(desc, context, [do: body]) do
    quote do
      test unquote(desc), unquote(context), do: unquote(body)
    end
  end
end
