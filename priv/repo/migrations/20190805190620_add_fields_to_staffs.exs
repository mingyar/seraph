defmodule Seraph.Repo.Migrations.AddFieldsToStaffs do
  use Ecto.Migration

  def change do
      alter table (:staffs) do
        add :DTSYear, :integer
        add :ministry, :string
        add :active, :boolean, null: false, default: true
      end
  end
end
