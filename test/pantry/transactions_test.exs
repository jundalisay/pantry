defmodule Pantry.TransactionsTest do
  use Pantry.DataCase

  alias Pantry.Transactions

  describe "records" do
    alias Pantry.Transactions.Record

    @valid_attrs %{bottle_points: 42, brands: "some brands", compost_points: 42, details: "some details", plastic_points: 42}
    @update_attrs %{bottle_points: 43, brands: "some updated brands", compost_points: 43, details: "some updated details", plastic_points: 43}
    @invalid_attrs %{bottle_points: nil, brands: nil, compost_points: nil, details: nil, plastic_points: nil}

    def record_fixture(attrs \\ %{}) do
      {:ok, record} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Transactions.create_record()

      record
    end

    test "list_records/0 returns all records" do
      record = record_fixture()
      assert Transactions.list_records() == [record]
    end

    test "get_record!/1 returns the record with given id" do
      record = record_fixture()
      assert Transactions.get_record!(record.id) == record
    end

    test "create_record/1 with valid data creates a record" do
      assert {:ok, %Record{} = record} = Transactions.create_record(@valid_attrs)
      assert record.bottle_points == 42
      assert record.brands == "some brands"
      assert record.compost_points == 42
      assert record.details == "some details"
      assert record.plastic_points == 42
    end

    test "create_record/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Transactions.create_record(@invalid_attrs)
    end

    test "update_record/2 with valid data updates the record" do
      record = record_fixture()
      assert {:ok, %Record{} = record} = Transactions.update_record(record, @update_attrs)
      assert record.bottle_points == 43
      assert record.brands == "some updated brands"
      assert record.compost_points == 43
      assert record.details == "some updated details"
      assert record.plastic_points == 43
    end

    test "update_record/2 with invalid data returns error changeset" do
      record = record_fixture()
      assert {:error, %Ecto.Changeset{}} = Transactions.update_record(record, @invalid_attrs)
      assert record == Transactions.get_record!(record.id)
    end

    test "delete_record/1 deletes the record" do
      record = record_fixture()
      assert {:ok, %Record{}} = Transactions.delete_record(record)
      assert_raise Ecto.NoResultsError, fn -> Transactions.get_record!(record.id) end
    end

    test "change_record/1 returns a record changeset" do
      record = record_fixture()
      assert %Ecto.Changeset{} = Transactions.change_record(record)
    end
  end
end
