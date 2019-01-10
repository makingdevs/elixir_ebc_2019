defmodule EbcWebapp.Repo do
  use Ecto.Repo,
    otp_app: :ebc_webapp,
    adapter: Ecto.Adapters.Postgres
end
