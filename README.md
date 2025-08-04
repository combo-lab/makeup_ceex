# MakeupCEEx

A [Makeup](https://github.com/elixir-makeup/makeup/) lexer for the CEEx language.

## Installation

Add `makeup_ceex` to the list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:makeup_ceex, <requirement>}
  ]
end
```

## Note

This package provides one lexer:

- `Makeup.Lexers.CEExLexer`

It automatically registers:

- the `ceex` language within the `~CE` sigil.
- the `ceex` language within the files which are end with `.ceex` extension.

## Thanks

Forked from [elixir-makeup/makeup_eex](https://github.com/elixir-makeup/makeup_eex).
Many thanks to the original authors and contributors.

## License

BSD 2-Clause License
