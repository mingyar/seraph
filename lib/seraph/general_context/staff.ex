defmodule Seraph.GeneralContext.Staff do
  use Ecto.Schema
  import Ecto.Changeset

  schema "staffs" do
    field :birthDate, :date
    field :email, :string
    field :name, :string
    field :DTSYear, :integer
    field :ministry, :string
    field :active, :boolean

    timestamps()
  end

  @doc false
  def changeset(staff, attrs) do
    staff
    |> cast(attrs, [:email, :name, :birthDate, :DTSYear, :ministry, :active])
    |> validate_required([:email, :name, :birthDate])
  end
end
