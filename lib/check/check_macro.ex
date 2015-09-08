defmodule Check.CheckMacro do
  @moduledoc """
  Defines the `check` macro used in our test cases.
  """

  defmacro check(desc, [do: body]) do
    quote location: :keep do
      test unquote(desc), do: unquote(body)
    end
  end

  defmacro check(desc, [given: assignments], [do: body]) do
    scope = __CALLER__.context_modules |> hd
    body  = {:quote, [], [[do: body]]}
    quote do
      test unquote(desc) do
        Check.Runner.test(
          unquote(body),
          unquote(scope),
          unquote(assignments)
        )
      end
    end
  end

  defmacro check(desc, context, [do: body]) do
    quote do
      test unquote(desc), unquote(context) do
        unquote(body)
      end
    end
  end
end
