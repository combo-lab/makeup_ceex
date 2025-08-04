defmodule Makeup.Lexers.CEExLexer.Application do
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
end
