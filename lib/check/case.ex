defmodule Check.Case do
  @moduledoc """
  Sets up a `Check` case, importing the `check` macro.
  
  When used it accepts the same arguments as `ExUnit.Case`

  # Examples

      defmodule AssertionTest do
        # Use the module
        use Check.Case, async: true

        # The check macro is imported for us
        check "that true always passes" do
          assert true
        end
      end
  """

  defmacro __using__(args) do
    quote do
      use ExUnit.Case, unquote(args)
      import Check.CheckMacro
      import Check.Domain
    end
  end
end
