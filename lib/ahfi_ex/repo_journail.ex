
defmodule AhfiEx.RepoJournal do

  use Ecto.Repo,
    otp_app: :ahfi_ex,
    adapter: Sqlite.Ecto
end
