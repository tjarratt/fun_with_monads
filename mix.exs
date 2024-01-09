defmodule FunWithMonads.MixProject do
  use Mix.Project

  def project do
    [
      app: :fun_with_monads,
      dialyzer: dialyzer(),
      version: "0.1.0",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:rustic_maybe, "~> 0.1.0"},
      {:dialyxir, "~> 1.3", only: [:dev], runtime: false},
    ]
  end

  defp dialyzer,
    do: [
      plt_add_apps: [:mix],
      plt_core_path: "_build/#{Mix.env()}"
    ]
end
