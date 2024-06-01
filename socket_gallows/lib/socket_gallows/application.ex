defmodule SocketGallows.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      SocketGallowsWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:socket_gallows, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: SocketGallows.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: SocketGallows.Finch},
      # Start a worker by calling: SocketGallows.Worker.start_link(arg)
      # {SocketGallows.Worker, arg},
      # Start to serve requests, typically the last entry
      SocketGallowsWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SocketGallows.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SocketGallowsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
