defmodule Seraph.Repo.Migrations.ModifyAge do
  use Ecto.Migration

  def change do
    alter table (:staffs) do
      remove :age
      add :birthDate, :date
    end
  end
end
