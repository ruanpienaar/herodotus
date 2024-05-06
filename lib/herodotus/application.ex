defmodule Herodotus.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      HerodotusWeb.Telemetry,
      Herodotus.Repo,
      {DNSCluster, query: Application.get_env(:herodotus, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Herodotus.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Herodotus.Finch},
      # Start a worker by calling: Herodotus.Worker.start_link(arg)
      # {Herodotus.Worker, arg},
      # Start to serve requests, typically the last entry
      HerodotusWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Herodotus.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    HerodotusWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
