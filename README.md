# MixRebar3

Mix plugin to run rebar3 as a compiler for your project. Useful if your project is using rebar3 for compiling (e.g. native components) but you also want to use mix for other features such as generating docs. 

## Installation

Just add `mix_rebar3` to your deps in `mix.exs` and replace your compilers with `:rebar3`

```elixir
def project do
  [
    compilers: [:rebar3],
  ]
end

def deps do
  [
    {:mix_rebar3, "~> 0.1.0"}
  ]
end
```
