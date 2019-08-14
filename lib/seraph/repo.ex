defmodule Seraph.Repo do
  use Ecto.Repo,
    otp_app: :seraph,
    adapter: Ecto.Adapters.Postgres
end
