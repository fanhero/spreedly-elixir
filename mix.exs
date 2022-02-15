defmodule Spreedly.Mixfile do
  use Mix.Project

  def project do
    [
      app: :spreedly,
      version: "2.2.0",
      elixir: "~> 1.4",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env()),
      description: description(),
      package: package(),
      deps: deps(),
      dialyzer: [ignore_warnings: "dialyzer.ignore-warnings"]
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :httpoison, :poison]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:httpoison, "~> 1.8"},
      {:hackney, "~> 1.17"},
      {:poison, "~> 4.0.1"},
      {:ex_doc, "~> 0.28", only: :dev},
      {:dialyxir, "~> 1.1", only: [:dev], runtime: false},
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp description do
    """
    A wrapper for the Spreedly API.
    """
  end

  defp package do
    [
      maintainers: ["Duff O'Melia <duff@omelia.org>", "Jared Knipp <jared@spreedly.com>"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/spreedly/spreedly-elixir"}
    ]
  end
end
