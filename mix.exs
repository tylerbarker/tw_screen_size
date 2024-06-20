defmodule TwScreenSize.MixProject do
  use Mix.Project

  @version "1.0.0"

  def project do
    [
      app: :tw_screen_size,
      version: @version,
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      package: package(),
      deps: deps(),
      docs: docs(),
      description: """
      A tiny LiveView widget showing the current screen dimensions and Tailwind breakpoint.
      """
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
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:phoenix_live_view, "~> 0.19"}
    ]
  end

  defp docs() do
    [
      main: "readme",
      name: "TwScreenSize",
      source_ref: "v#{@version}",
      canonical: "http://hexdocs.pm/tw_screen_size",
      source_url: "https://github.com/tylerbarker/tw_screen_size",
      extras: [
        "README.md",
        "CHANGELOG.md"
      ],
      skip_undefined_reference_warnings_on: ["CHANGELOG.md"]
    ]
  end

  defp package do
    [
      maintainers: ["Tyler Barker"],
      licenses: ["MIT"],
      links: %{
        Changelog: "https://github.com/tylerbarker/tw_screen_size/blob/main/CHANGELOG.md",
        GitHub: "https://github.com/tylerbarker/tw_screen_size"
      },
      files: ~w(mix.exs lib assets README.md LICENSE.md CHANGELOG.md)
    ]
  end
end
