defmodule HamVarzeshi.Repo do
  use Ecto.Repo,
    otp_app: :ham_varzeshi,
    adapter: Ecto.Adapters.Postgres
end
