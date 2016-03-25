ExUnit.start

Mix.Task.run "ecto.create", ~w(-r AhfiEx.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r AhfiEx.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(AhfiEx.Repo)

