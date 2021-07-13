defmodule Seraph.Repo.Migrations.CreateStaffPaymentLines do
  use Ecto.Migration

  def change do
    create table(:staff_payment_lines) do
      add :due_date, :date
      add :value, :float
      add :is_payed, :boolean, default: false, null: false
      add :staff_id, references(:staffs, on_delete: :nothing)

      timestamps()
    end

    create index(:staff_payment_lines, [:staff_id])
  end
end
