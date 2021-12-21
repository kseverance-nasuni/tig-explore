defmodule HttpData.DataTest do

  alias HttpData.Data

  describe "points" do
    alias HttpData.Data.Point

    @valid_attrs %{a: 42, b: 120.5, c: "some c"}
    @update_attrs %{a: 43, b: 456.7, c: "some updated c"}
    @invalid_attrs %{a: nil, b: nil, c: nil}

    def point_fixture(attrs \\ %{}) do
      {:ok, point} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Data.create_point()

      point
    end

    test "list_points/0 returns all points" do
      point = point_fixture()
      assert Data.list_points() == [point]
    end

    test "get_point!/1 returns the point with given id" do
      point = point_fixture()
      assert Data.get_point!(point.id) == point
    end

    test "create_point/1 with valid data creates a point" do
      assert {:ok, %Point{} = point} = Data.create_point(@valid_attrs)
      assert point.a == 42
      assert point.b == 120.5
      assert point.c == "some c"
    end

    test "create_point/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Data.create_point(@invalid_attrs)
    end

    test "update_point/2 with valid data updates the point" do
      point = point_fixture()
      assert {:ok, %Point{} = point} = Data.update_point(point, @update_attrs)
      assert point.a == 43
      assert point.b == 456.7
      assert point.c == "some updated c"
    end

    test "update_point/2 with invalid data returns error changeset" do
      point = point_fixture()
      assert {:error, %Ecto.Changeset{}} = Data.update_point(point, @invalid_attrs)
      assert point == Data.get_point!(point.id)
    end

    test "delete_point/1 deletes the point" do
      point = point_fixture()
      assert {:ok, %Point{}} = Data.delete_point(point)
      assert_raise Ecto.NoResultsError, fn -> Data.get_point!(point.id) end
    end

    test "change_point/1 returns a point changeset" do
      point = point_fixture()
      assert %Ecto.Changeset{} = Data.change_point(point)
    end
  end
end
