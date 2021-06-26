defmodule Knifecoin.MixProject do
  use Mix.Project

  @version "0.1.0"

  def project do
    [
      app: :knifecoin,
      version: @version,
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env()),
      deps: deps(),
      aliases: aliases(),
      package: package(),

      # Test
      test_pattern: "*_test.exs"
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Knifecoin.Application, []}
    ]
  end

  defp deps do
    [
      # Dev and test dependencies
      {:excoveralls, "~> 0.14.0", only: :test},
      {:propcheck, "~> 1.4.0", only: :test},
      {:credo, "~> 1.5.5", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.1.0", only: :dev, runtime: false},
      {:benchfella, "~> 0.3.5", only: :dev}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp package, do: [maintainers: ["lizhaochao", "wulan"], licenses: ["MIT"]]

  defp aliases, do: [test: ["format", "test"], bench: ["format", "bench"]]
end
