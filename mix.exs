defmodule AntlHttpClient.MixProject do
  use Mix.Project

  @version "0.5.0"
  @source_url "https://github.com/annatel/antl_http_client"

  def project do
    [
      app: :antl_http_client,
      elixir: "~> 1.12",
      version: version(),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      elixirc_paths: elixirc_paths(Mix.env()),
      description: "Wrapper on Finch Http client",
      package: package()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp package do
    [
      licenses: ["MIT"],
      links: %{"GitHub" => @source_url}
    ]
  end

  defp deps do
    [
      {:finch, "~> 0.19"},
      {:bypass, "~> 2.1.0", only: :test},
      {:app_recorder, "~> 0.4", [env: :prod, hex: "app_recorder", repo: "hexpm"]}
    ]
  end

  defp aliases do
    [
      "app.version": &display_app_version/1
    ]
  end

  defp version(), do: @version
  defp display_app_version(_), do: Mix.shell().info(version())
end
