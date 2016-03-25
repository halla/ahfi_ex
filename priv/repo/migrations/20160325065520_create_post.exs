defmodule AhfiEx.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :body, :text
      add :slug, :string
      add :date_published, :datetime

     # timestamps
    end

  end
end
