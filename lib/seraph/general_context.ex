defmodule Seraph.GeneralContext do
  @moduledoc """
  The GeneralContext context.
  """

  import Ecto.Query, warn: false
  alias Seraph.Repo

  alias Seraph.GeneralContext.Staff

  @doc """
  Returns the list of staffs.

  ## Examples

      iex> list_staffs()
      [%Staff{}, ...]

  """
  def list_staffs do
    Repo.all(Staff)
  end

  @doc """
  Gets a single staff.

  Raises `Ecto.NoResultsError` if the Staff does not exist.

  ## Examples

      iex> get_staff!(123)
      %Staff{}

      iex> get_staff!(456)
      ** (Ecto.NoResultsError)

  """
  def get_staff!(id), do: Repo.get!(Staff, id)

  @doc """
  Creates a staff.

  ## Examples

      iex> create_staff(%{field: value})
      {:ok, %Staff{}}

      iex> create_staff(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_staff(attrs \\ %{}) do
    %Staff{}
    |> Staff.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a staff.

  ## Examples

      iex> update_staff(staff, %{field: new_value})
      {:ok, %Staff{}}

      iex> update_staff(staff, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_staff(%Staff{} = staff, attrs) do
    staff
    |> Staff.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Staff.

  ## Examples

      iex> delete_staff(staff)
      {:ok, %Staff{}}

      iex> delete_staff(staff)
      {:error, %Ecto.Changeset{}}

  """
  def delete_staff(%Staff{} = staff) do
    Repo.delete(staff)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking staff changes.

  ## Examples

      iex> change_staff(staff)
      %Ecto.Changeset{source: %Staff{}}

  """
  def change_staff(%Staff{} = staff) do
    Staff.changeset(staff, %{})
  end

  alias Seraph.GeneralContext.StaffPaymentLine

  @doc """
  Returns the list of staff_payment_lines.

  ## Examples

      iex> list_staff_payment_lines()
      [%StaffPaymentLine{}, ...]

  """
  def list_staff_payment_lines do
    Repo.all(StaffPaymentLine)
  end

  @doc """
  Gets a single staff_payment_line.

  Raises `Ecto.NoResultsError` if the Staff payment line does not exist.

  ## Examples

      iex> get_staff_payment_line!(123)
      %StaffPaymentLine{}

      iex> get_staff_payment_line!(456)
      ** (Ecto.NoResultsError)

  """
  def get_staff_payment_line!(id), do: Repo.get!(StaffPaymentLine, id)

  @doc """
  Creates a staff_payment_line.

  ## Examples

      iex> create_staff_payment_line(%{field: value})
      {:ok, %StaffPaymentLine{}}

      iex> create_staff_payment_line(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_staff_payment_line(attrs \\ %{}) do
    %StaffPaymentLine{}
    |> StaffPaymentLine.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a staff_payment_line.

  ## Examples

      iex> update_staff_payment_line(staff_payment_line, %{field: new_value})
      {:ok, %StaffPaymentLine{}}

      iex> update_staff_payment_line(staff_payment_line, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_staff_payment_line(%StaffPaymentLine{} = staff_payment_line, attrs) do
    staff_payment_line
    |> StaffPaymentLine.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a StaffPaymentLine.

  ## Examples

      iex> delete_staff_payment_line(staff_payment_line)
      {:ok, %StaffPaymentLine{}}

      iex> delete_staff_payment_line(staff_payment_line)
      {:error, %Ecto.Changeset{}}

  """
  def delete_staff_payment_line(%StaffPaymentLine{} = staff_payment_line) do
    Repo.delete(staff_payment_line)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking staff_payment_line changes.

  ## Examples

      iex> change_staff_payment_line(staff_payment_line)
      %Ecto.Changeset{source: %StaffPaymentLine{}}

  """
  def change_staff_payment_line(%StaffPaymentLine{} = staff_payment_line) do
    StaffPaymentLine.changeset(staff_payment_line, %{})
  end
end
