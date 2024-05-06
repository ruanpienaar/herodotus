defmodule Herodotus.Repo do
  use Ecto.Repo,
    otp_app: :herodotus,
    adapter: Ecto.Adapters.Postgres
end
