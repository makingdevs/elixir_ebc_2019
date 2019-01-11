defmodule EbcWebapp.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :publication_date, :naive_datetime
      add :body, :string

      timestamps()
    end

  end
end
