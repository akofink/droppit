defmodule Droppit.Mixfile do
  use Mix.Project

  def project do
    [ app: :droppit,
      version: "0.0.1",
      elixir: "~> 0.14.0",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [
      mod: { Droppit, [] },
      applications: [:phoenix]
    ]
  end

  # Returns the list of dependencies in the format:
  # { :foobar, git: "https://github.com/elixir-lang/foobar.git", tag: "0.1" }
  #
  # To specify particular versions, regardless of the tag, do:
  # { :barbat, "~> 0.1", github: "elixir-lang/barbat" }
  defp deps do
    [
      {:cowboy, "~> 0.10.0", github: "extend/cowboy", optional: true},
      {:phoenix, "0.3.1"},
      {:calliope, github: "nurugger07/calliope"},
      {:exactor, "~> 0.5.0"}
    ]
  end
end
