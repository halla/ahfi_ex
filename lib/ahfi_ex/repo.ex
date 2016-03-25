defmodule AhfiEx.Repo do
  use Ecto.Repo,
    otp_app: :ahfi_ex
    #adapter: Sqlite.Ecto,
    #database: "ahfi.sqlite3"
end
