defmodule SeraphWeb.StaffPaymentLineController do
  use SeraphWeb, :controller

  alias Seraph.GeneralContext
  alias Seraph.GeneralContext.StaffPaymentLine

  def index(conn, _params) do
    staff_payment_lines = GeneralContext.list_staff_payment_lines()
    render(conn, "index.html", staff_payment_lines: staff_payment_lines)
  end

  def new(conn, _params) do
    changeset = GeneralContext.change_staff_payment_line(%StaffPaymentLine{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"staff_payment_line" => staff_payment_line_params}) do
    case GeneralContext.create_staff_payment_line(staff_payment_line_params) do
      {:ok, staff_payment_line} ->
        conn
        |> put_flash(:info, "Staff payment line created successfully.")
        |> redirect(to: Routes.staff_payment_line_path(conn, :show, staff_payment_line))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    staff_payment_line = GeneralContext.get_staff_payment_line!(id)
    render(conn, "show.html", staff_payment_line: staff_payment_line)
  end

  def edit(conn, %{"id" => id}) do
    staff_payment_line = GeneralContext.get_staff_payment_line!(id)
    changeset = GeneralContext.change_staff_payment_line(staff_payment_line)
    render(conn, "edit.html", staff_payment_line: staff_payment_line, changeset: changeset)
  end

  def update(conn, %{"id" => id, "staff_payment_line" => staff_payment_line_params}) do
    staff_payment_line = GeneralContext.get_staff_payment_line!(id)

    case GeneralContext.update_staff_payment_line(staff_payment_line, staff_payment_line_params) do
      {:ok, staff_payment_line} ->
        conn
        |> put_flash(:info, "Staff payment line updated successfully.")
        |> redirect(to: Routes.staff_payment_line_path(conn, :show, staff_payment_line))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", staff_payment_line: staff_payment_line, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    staff_payment_line = GeneralContext.get_staff_payment_line!(id)
    {:ok, _staff_payment_line} = GeneralContext.delete_staff_payment_line(staff_payment_line)

    conn
    |> put_flash(:info, "Staff payment line deleted successfully.")
    |> redirect(to: Routes.staff_payment_line_path(conn, :index))
  end
end
