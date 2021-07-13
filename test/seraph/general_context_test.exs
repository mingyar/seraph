defmodule Seraph.GeneralContextTest do
  use Seraph.DataCase

  alias Seraph.GeneralContext

  describe "staffs" do
    alias Seraph.GeneralContext.Staff

    @valid_attrs %{age: 42, email: "some email", name: "some name"}
    @update_attrs %{age: 43, email: "some updated email", name: "some updated name"}
    @invalid_attrs %{age: nil, email: nil, name: nil}

    def staff_fixture(attrs \\ %{}) do
      {:ok, staff} =
        attrs
        |> Enum.into(@valid_attrs)
        |> GeneralContext.create_staff()

      staff
    end

    test "list_staffs/0 returns all staffs" do
      staff = staff_fixture()
      assert GeneralContext.list_staffs() == [staff]
    end

    test "get_staff!/1 returns the staff with given id" do
      staff = staff_fixture()
      assert GeneralContext.get_staff!(staff.id) == staff
    end

    test "create_staff/1 with valid data creates a staff" do
      assert {:ok, %Staff{} = staff} = GeneralContext.create_staff(@valid_attrs)
      assert staff.age == 42
      assert staff.email == "some email"
      assert staff.name == "some name"
    end

    test "create_staff/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = GeneralContext.create_staff(@invalid_attrs)
    end

    test "update_staff/2 with valid data updates the staff" do
      staff = staff_fixture()
      assert {:ok, %Staff{} = staff} = GeneralContext.update_staff(staff, @update_attrs)
      assert staff.age == 43
      assert staff.email == "some updated email"
      assert staff.name == "some updated name"
    end

    test "update_staff/2 with invalid data returns error changeset" do
      staff = staff_fixture()
      assert {:error, %Ecto.Changeset{}} = GeneralContext.update_staff(staff, @invalid_attrs)
      assert staff == GeneralContext.get_staff!(staff.id)
    end

    test "delete_staff/1 deletes the staff" do
      staff = staff_fixture()
      assert {:ok, %Staff{}} = GeneralContext.delete_staff(staff)
      assert_raise Ecto.NoResultsError, fn -> GeneralContext.get_staff!(staff.id) end
    end

    test "change_staff/1 returns a staff changeset" do
      staff = staff_fixture()
      assert %Ecto.Changeset{} = GeneralContext.change_staff(staff)
    end
  end

  describe "staff_payment_lines" do
    alias Seraph.GeneralContext.StaffPaymentLine

    @valid_attrs %{due_date: ~D[2010-04-17], is_payed: true, value: 120.5}
    @update_attrs %{due_date: ~D[2011-05-18], is_payed: false, value: 456.7}
    @invalid_attrs %{due_date: nil, is_payed: nil, value: nil}

    def staff_payment_line_fixture(attrs \\ %{}) do
      {:ok, staff_payment_line} =
        attrs
        |> Enum.into(@valid_attrs)
        |> GeneralContext.create_staff_payment_line()

      staff_payment_line
    end

    test "list_staff_payment_lines/0 returns all staff_payment_lines" do
      staff_payment_line = staff_payment_line_fixture()
      assert GeneralContext.list_staff_payment_lines() == [staff_payment_line]
    end

    test "get_staff_payment_line!/1 returns the staff_payment_line with given id" do
      staff_payment_line = staff_payment_line_fixture()
      assert GeneralContext.get_staff_payment_line!(staff_payment_line.id) == staff_payment_line
    end

    test "create_staff_payment_line/1 with valid data creates a staff_payment_line" do
      assert {:ok, %StaffPaymentLine{} = staff_payment_line} = GeneralContext.create_staff_payment_line(@valid_attrs)
      assert staff_payment_line.due_date == ~D[2010-04-17]
      assert staff_payment_line.is_payed == true
      assert staff_payment_line.value == 120.5
    end

    test "create_staff_payment_line/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = GeneralContext.create_staff_payment_line(@invalid_attrs)
    end

    test "update_staff_payment_line/2 with valid data updates the staff_payment_line" do
      staff_payment_line = staff_payment_line_fixture()
      assert {:ok, %StaffPaymentLine{} = staff_payment_line} = GeneralContext.update_staff_payment_line(staff_payment_line, @update_attrs)
      assert staff_payment_line.due_date == ~D[2011-05-18]
      assert staff_payment_line.is_payed == false
      assert staff_payment_line.value == 456.7
    end

    test "update_staff_payment_line/2 with invalid data returns error changeset" do
      staff_payment_line = staff_payment_line_fixture()
      assert {:error, %Ecto.Changeset{}} = GeneralContext.update_staff_payment_line(staff_payment_line, @invalid_attrs)
      assert staff_payment_line == GeneralContext.get_staff_payment_line!(staff_payment_line.id)
    end

    test "delete_staff_payment_line/1 deletes the staff_payment_line" do
      staff_payment_line = staff_payment_line_fixture()
      assert {:ok, %StaffPaymentLine{}} = GeneralContext.delete_staff_payment_line(staff_payment_line)
      assert_raise Ecto.NoResultsError, fn -> GeneralContext.get_staff_payment_line!(staff_payment_line.id) end
    end

    test "change_staff_payment_line/1 returns a staff_payment_line changeset" do
      staff_payment_line = staff_payment_line_fixture()
      assert %Ecto.Changeset{} = GeneralContext.change_staff_payment_line(staff_payment_line)
    end
  end
end
