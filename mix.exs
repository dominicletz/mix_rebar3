defmodule MixRebar3.MixProject do
  use Mix.Project

  def project do
    [
      app: :mix_rebar3,
      version: "0.3.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      # Hex
      description: "mix_rebar3 is a rebar3 compiler for your mix project",
      package: [
        licenses: ["Apache 2.0"],
        maintainers: ["Dominic Letz"],
        links: %{"GitHub" => "https://github.com/dominicletz/mix_rebar3"}
      ]
    ]
  end

  def application do
    []
  end

  defp deps do
    []
  end
end
