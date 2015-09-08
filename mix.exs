defmodule Check.Mixfile do
  use Mix.Project

  @version "0.0.3"

  def project do
    [
      app: :check,
      version: @version,
      elixir: "~> 1.0",
      deps: deps,
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      # test_coverage: [tool: ExCoveralls],

      name: "Check",
      source_url: "https://github.com/lpil/check",
      description: "Check yo'self before you wreck yo'self.",
      package: [
        contributors: ["Louis Pilfold"],
        licenses: ["MIT"],
        links: %{ "GitHub" => "https://github.com/lpil/check" },
      ]
    ]
  end

  def application do
    [
      applications: [],
    ]
  end


  defp deps do
    [
      # # Test coverage checker
      # {:excoveralls, only: ~w(dev test)a},

      # Automatic test runner
      {:mix_test_watch, only: :dev},

      # Erlang quickcheck implementation
      {:excheck, "~> 0.2", only: :test},
      # Triqcheck Elixir wrapper
      {:triq, github: "krestenkrab/triq", only: :test},

      # Code linter
      {:dogma, github: "lpil/dogma"},

      # # Documentation checker
      # {:inch_ex, only: ~w(dev test docs)a},

      # Markdown processor
      {:earmark, "~> 0.1", only: :dev},
      # Documentation generator
      {:ex_doc, "~> 0.7", only: :dev},
    ]
  end
end
