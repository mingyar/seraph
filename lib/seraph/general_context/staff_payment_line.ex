defmodule Seraph.GeneralContext.StaffPaymentLine do
  use Ecto.Schema
  import Ecto.Changeset

  schema "staff_payment_lines" do
    field :due_date, :date
    field :is_payed, :boolean, default: false
    field :value, :float
    field :staff_id, :id

    timestamps()
  end

  @doc false
  def changeset(staff_payment_line, attrs) do
    staff_payment_line
    |> cast(attrs, [:due_date, :value, :is_payed])
    |> validate_required([:due_date, :value, :is_payed])
  end
end
