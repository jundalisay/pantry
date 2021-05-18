defmodule PantryWeb.RecordControllerTest do
  use PantryWeb.ConnCase

  alias Pantry.Transactions

  @create_attrs %{bottle_points: 42, brands: "some brands", compost_points: 42, details: "some details", plastic_points: 42}
  @update_attrs %{bottle_points: 43, brands: "some updated brands", compost_points: 43, details: "some updated details", plastic_points: 43}
  @invalid_attrs %{bottle_points: nil, brands: nil, compost_points: nil, details: nil, plastic_points: nil}

  def fixture(:record) do
    {:ok, record} = Transactions.create_record(@create_attrs)
    record
  end

  describe "index" do
    test "lists all records", %{conn: conn} do
      conn = get(conn, Routes.record_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Records"
    end
  end

  describe "new record" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.record_path(conn, :new))
      assert html_response(conn, 200) =~ "New Record"
    end
  end

  describe "create record" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.record_path(conn, :create), record: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.record_path(conn, :show, id)

      conn = get(conn, Routes.record_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Record"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.record_path(conn, :create), record: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Record"
    end
  end

  describe "edit record" do
    setup [:create_record]

    test "renders form for editing chosen record", %{conn: conn, record: record} do
      conn = get(conn, Routes.record_path(conn, :edit, record))
      assert html_response(conn, 200) =~ "Edit Record"
    end
  end

  describe "update record" do
    setup [:create_record]

    test "redirects when data is valid", %{conn: conn, record: record} do
      conn = put(conn, Routes.record_path(conn, :update, record), record: @update_attrs)
      assert redirected_to(conn) == Routes.record_path(conn, :show, record)

      conn = get(conn, Routes.record_path(conn, :show, record))
      assert html_response(conn, 200) =~ "some updated brands"
    end

    test "renders errors when data is invalid", %{conn: conn, record: record} do
      conn = put(conn, Routes.record_path(conn, :update, record), record: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Record"
    end
  end

  describe "delete record" do
    setup [:create_record]

    test "deletes chosen record", %{conn: conn, record: record} do
      conn = delete(conn, Routes.record_path(conn, :delete, record))
      assert redirected_to(conn) == Routes.record_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.record_path(conn, :show, record))
      end
    end
  end

  defp create_record(_) do
    record = fixture(:record)
    %{record: record}
  end
end
