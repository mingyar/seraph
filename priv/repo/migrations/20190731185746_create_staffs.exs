defmodule Seraph.Repo.Migrations.CreateStaffs do
  use Ecto.Migration

  def change do
    create table(:staffs) do
      add :email, :string
      add :name, :string
      add :age, :integer

      timestamps()
    end

  end
end
