defmodule SeraphWeb.StaffController do
  use SeraphWeb, :controller

  alias Seraph.GeneralContext
  alias Seraph.GeneralContext.Staff

  def index(conn, _params) do
    staffs = GeneralContext.list_staffs()
    render(conn, "index.html", staffs: staffs)
  end

  def new(conn, _params) do
    changeset = GeneralContext.change_staff(%Staff{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"staff" => staff_params}) do
    case GeneralContext.create_staff(staff_params) do
      {:ok, staff} ->
        conn
        |> put_flash(:info, "Staff created successfully.")
        |> redirect(to: Routes.staff_path(conn, :show, staff))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    staff = GeneralContext.get_staff!(id)
    render(conn, "show.html", staff: staff)
  end

  def edit(conn, %{"id" => id}) do
    staff = GeneralContext.get_staff!(id)
    changeset = GeneralContext.change_staff(staff)
    render(conn, "edit.html", staff: staff, changeset: changeset)
  end

  def update(conn, %{"id" => id, "staff" => staff_params}) do
    staff = GeneralContext.get_staff!(id)

    case GeneralContext.update_staff(staff, staff_params) do
      {:ok, staff} ->
        conn
        |> put_flash(:info, "Staff updated successfully.")
        |> redirect(to: Routes.staff_path(conn, :show, staff))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", staff: staff, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    staff = GeneralContext.get_staff!(id)
    {:ok, _staff} = GeneralContext.delete_staff(staff)

    conn
    |> put_flash(:info, "Staff deleted successfully.")
    |> redirect(to: Routes.staff_path(conn, :index))
  end
end
