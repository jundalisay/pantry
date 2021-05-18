defmodule PantryWeb.HubControllerTest do
  use PantryWeb.ConnCase

  alias Pantry.Orgs

  @create_attrs %{address: "some address", avatar: "some avatar", email: "some email", facebook: "some facebook", kind: "some kind", landline: "some landline", latitude: "120.5", longitude: "120.5", mobile: "some mobile", name: "some name", slogan: "some slogan"}
  @update_attrs %{address: "some updated address", avatar: "some updated avatar", email: "some updated email", facebook: "some updated facebook", kind: "some updated kind", landline: "some updated landline", latitude: "456.7", longitude: "456.7", mobile: "some updated mobile", name: "some updated name", slogan: "some updated slogan"}
  @invalid_attrs %{address: nil, avatar: nil, email: nil, facebook: nil, kind: nil, landline: nil, latitude: nil, longitude: nil, mobile: nil, name: nil, slogan: nil}

  def fixture(:hub) do
    {:ok, hub} = Orgs.create_hub(@create_attrs)
    hub
  end

  describe "index" do
    test "lists all hubs", %{conn: conn} do
      conn = get(conn, Routes.hub_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Hubs"
    end
  end

  describe "new hub" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.hub_path(conn, :new))
      assert html_response(conn, 200) =~ "New Hub"
    end
  end

  describe "create hub" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.hub_path(conn, :create), hub: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.hub_path(conn, :show, id)

      conn = get(conn, Routes.hub_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Hub"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.hub_path(conn, :create), hub: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Hub"
    end
  end

  describe "edit hub" do
    setup [:create_hub]

    test "renders form for editing chosen hub", %{conn: conn, hub: hub} do
      conn = get(conn, Routes.hub_path(conn, :edit, hub))
      assert html_response(conn, 200) =~ "Edit Hub"
    end
  end

  describe "update hub" do
    setup [:create_hub]

    test "redirects when data is valid", %{conn: conn, hub: hub} do
      conn = put(conn, Routes.hub_path(conn, :update, hub), hub: @update_attrs)
      assert redirected_to(conn) == Routes.hub_path(conn, :show, hub)

      conn = get(conn, Routes.hub_path(conn, :show, hub))
      assert html_response(conn, 200) =~ "some updated address"
    end

    test "renders errors when data is invalid", %{conn: conn, hub: hub} do
      conn = put(conn, Routes.hub_path(conn, :update, hub), hub: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Hub"
    end
  end

  describe "delete hub" do
    setup [:create_hub]

    test "deletes chosen hub", %{conn: conn, hub: hub} do
      conn = delete(conn, Routes.hub_path(conn, :delete, hub))
      assert redirected_to(conn) == Routes.hub_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.hub_path(conn, :show, hub))
      end
    end
  end

  defp create_hub(_) do
    hub = fixture(:hub)
    %{hub: hub}
  end
end
