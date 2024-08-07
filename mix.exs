defmodule ExRockTest.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_rock_test,
      version: "0.1.0",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:elixir_uuid, "~> 1.2", only: [:test, :dev]},
      {:ex_rock, "~> 0.1.1"}
    ]
  end
end
