defmodule Dictionary.Application do
  use Application

  def start(_type, _args) do
   # import Supervisor.Spec

    options=[
      name: Directory.Supervisor,
      strategy: :one_for_one,
      max_restarts: 1,
       max_seconds: 5,

    ]

    children = [
      %{
        id: Dictionary.Wordlist,
        start: {Dictionary.Wordlist, :start_link,  []}
        }
    ]

    Supervisor.start_link(children,options)
  end
end
