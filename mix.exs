defmodule MakeupCEEx.MixProject do
  use Mix.Project

  @version "0.1.0"
  @url "https://github.com/combo-team/makeup_ceex"

  def project do
    [
      app: :makeup_ceex,
      version: @version,
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env()),
      deps: deps(),
      package: package(),
      description: "CEEx lexer for makeup",
      test_ignore_filters: [&String.starts_with?(&1, "test/fixtures")],
      docs: [
        main: "readme",
        extras: ["README.md"]
      ]
    ]
  end

  defp package do
    [
      name: :makeup_ceex,
      licenses: ["BSD-2-Clause"],
      links: %{"GitHub" => @url}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [],
      mod: {Makeup.Lexers.CEExLexer.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:nimble_parsec, "~> 1.2"},
      {:makeup, "~> 1.2.1 or ~> 1.3"},
      {:makeup_elixir, "~> 1.0"},
      {:makeup_eex, "~> 2.0"},
      {:makeup_html, "~> 0.2.0 or ~> 1.0"},
      {:ex_doc, "~> 0.27", only: :dev, runtime: false}
    ]
  end
end
