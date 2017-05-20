defmodule Xinscrape.Mixfile do
  use Mix.Project

  def project do
    [app: :xinscrape,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [extra_applications: [:logger, :httpoison, :exjsx]]
  end

  defp deps do
    [
      {:httpoison, "~> 0.8.0"},
      {:exjsx, "~> 3.2.0"}
    ]
  end
end
