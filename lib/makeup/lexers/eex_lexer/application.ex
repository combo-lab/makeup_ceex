defmodule Makeup.Lexers.EExLexer.Application do
  @moduledoc false
  use Application

  alias Makeup.Registry

  alias Makeup.Lexers.{
    CEExLexer,
    ElixirLexer
  }

  def start(_type, _args) do
    ElixirLexer.register_sigil_lexer("CE", CEExLexer)

    Registry.register_lexer(CEExLexer,
      names: ["ceex"],
      extensions: ["ceex"]
    )

    Supervisor.start_link([], strategy: :one_for_one)
  end

  def dynamic_html_lexer do
    case {Registry.get_lexer_by_name("html"), Registry.get_lexer_by_extension("html")} do
      {nil, nil} ->
        raise """
        The HEEx / EEx+HTML lexer requires an HTML lexer to be registered. You can do this for example by including

            {:makeup_html, "~> 1.0"}

        in your project's dependencies.
        """

      {nil, lexer_tuple} ->
        lexer_tuple

      {lexer_tuple, _} ->
        lexer_tuple
    end
  end
end
