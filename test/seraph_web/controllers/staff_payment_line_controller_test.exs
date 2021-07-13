defmodule SeraphWeb.StaffPaymentLineControllerTest do
  use SeraphWeb.ConnCase

  alias Seraph.GeneralContext

  @create_attrs %{due_date: ~D[2010-04-17], is_payed: true, value: 120.5}
  @update_attrs %{due_date: ~D[2011-05-18], is_payed: false, value: 456.7}
  @invalid_attrs %{due_date: nil, is_payed: nil, value: nil}

  def fixture(:staff_payment_line) do
    {:ok, staff_payment_line} = GeneralContext.create_staff_payment_line(@create_attrs)
    staff_payment_line
  end

  describe "index" do
    test "lists all staff_payment_lines", %{conn: conn} do
      conn = get(conn, Routes.staff_payment_line_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Staff payment lines"
    end
  end

  describe "new staff_payment_line" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.staff_payment_line_path(conn, :new))
      assert html_response(conn, 200) =~ "New Staff payment line"
    end
  end

  describe "create staff_payment_line" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.staff_payment_line_path(conn, :create), staff_payment_line: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.staff_payment_line_path(conn, :show, id)

      conn = get(conn, Routes.staff_payment_line_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Staff payment line"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.staff_payment_line_path(conn, :create), staff_payment_line: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Staff payment line"
    end
  end

  describe "edit staff_payment_line" do
    setup [:create_staff_payment_line]

    test "renders form for editing chosen staff_payment_line", %{conn: conn, staff_payment_line: staff_payment_line} do
      conn = get(conn, Routes.staff_payment_line_path(conn, :edit, staff_payment_line))
      assert html_response(conn, 200) =~ "Edit Staff payment line"
    end
  end

  describe "update staff_payment_line" do
    setup [:create_staff_payment_line]

    test "redirects when data is valid", %{conn: conn, staff_payment_line: staff_payment_line} do
      conn = put(conn, Routes.staff_payment_line_path(conn, :update, staff_payment_line), staff_payment_line: @update_attrs)
      assert redirected_to(conn) == Routes.staff_payment_line_path(conn, :show, staff_payment_line)

      conn = get(conn, Routes.staff_payment_line_path(conn, :show, staff_payment_line))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, staff_payment_line: staff_payment_line} do
      conn = put(conn, Routes.staff_payment_line_path(conn, :update, staff_payment_line), staff_payment_line: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Staff payment line"
    end
  end

  describe "delete staff_payment_line" do
    setup [:create_staff_payment_line]

    test "deletes chosen staff_payment_line", %{conn: conn, staff_payment_line: staff_payment_line} do
      conn = delete(conn, Routes.staff_payment_line_path(conn, :delete, staff_payment_line))
      assert redirected_to(conn) == Routes.staff_payment_line_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.staff_payment_line_path(conn, :show, staff_payment_line))
      end
    end
  end

  defp create_staff_payment_line(_) do
    staff_payment_line = fixture(:staff_payment_line)
    {:ok, staff_payment_line: staff_payment_line}
  end
end
