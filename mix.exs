defmodule MakeupCEEx.MixProject do
  use Mix.Project

  @version "0.1.0"
  @source_url "https://github.com/combo-lab/makeup_ceex"

  def project do
    [
      app: :makeup_ceex,
      version: @version,
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: "A Makeup lexer for the CEEx language",
      source_url: @source_url,
      homepage_url: @source_url,
      docs: docs(),
      package: package(),
      aliases: aliases()
    ]
  end

  def application do
    [
      mod: {Makeup.Lexers.CEExLexer.Application, []}
    ]
  end

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

  defp docs do
    [
      main: "readme",
      extras: ["README.md"]
    ]
  end

  defp package do
    [
      name: :makeup_ceex,
      licenses: ["BSD-2-Clause"],
      links: %{"GitHub" => @source_url}
    ]
  end

  defp aliases do
    [publish: ["hex.publish", "tag"], tag: &tag_release/1]
  end

  defp tag_release(_) do
    Mix.shell().info("Tagging release as v#{@version}")
    System.cmd("git", ["tag", "v#{@version}"])
    System.cmd("git", ["push", "--tags"])
  end
end
