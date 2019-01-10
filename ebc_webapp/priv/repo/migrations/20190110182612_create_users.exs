defmodule EbcWebapp.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :full_name, :string
      add :email, :string
      add :born_date, :date

      timestamps()
    end

  end
end
