defmodule Herodutus.Repo do
  use Ecto.Repo,
    otp_app: :herodutus,
    adapter: Ecto.Adapters.Postgres
end
