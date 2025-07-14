defmodule Yanapaq.Repo do
  use Ecto.Repo,
    otp_app: :yanapaq,
    adapter: Ecto.Adapters.SQLite3
end
