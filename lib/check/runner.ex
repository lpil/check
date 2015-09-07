defmodule Check.Runner do
  @moduledoc """
  The runner performs our tests multiple times until it encounters a failed
  assertion, or an exception.
  """

  @num_runs 100
  @runs 1..@num_runs

  @doc """
  Takes a test body's AST, and a keyword list of assignments, and runs the test
  #{@num_runs} times.

  The module in which the test AST was quoted must be given for the assignments
  to be registered in the correct scope.
  """
  def test(test_ast, scope, assignments) do
    ast = prepend_assignments( test_ast, scope, assignments )
    @runs
    |> Enum.each fn _ ->
      values = realise_assignments( assignments )
      Code.eval_quoted ast, values
    end
  end


  defp realise_assignments(assignments) do
    Enum.map assignments, fn {id, domain} ->
      {id, domain.generator.()}
    end
  end

  def prepend_assignments(test_ast, scope, assignments) do
    ast = assignment_ast( assignments, scope ) ++ [test_ast]
    {:__block__, [], ast}
  end

  defp assignment_ast(assignments, scope) do
    Enum.map assignments, fn {id, _} ->
      {:=, [],
        [
          {:x, [], scope},
          {:var!, [context: __MODULE__], [{id, [], __MODULE__}]},
        ]
      }
    end
  end
end
