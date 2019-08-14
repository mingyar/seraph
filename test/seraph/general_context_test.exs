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
end
