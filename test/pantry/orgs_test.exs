defmodule Pantry.OrgsTest do
  use Pantry.DataCase

  alias Pantry.Orgs

  describe "hubs" do
    alias Pantry.Orgs.Hub

    @valid_attrs %{address: "some address", avatar: "some avatar", email: "some email", facebook: "some facebook", kind: "some kind", landline: "some landline", latitude: "120.5", longitude: "120.5", mobile: "some mobile", name: "some name", slogan: "some slogan"}
    @update_attrs %{address: "some updated address", avatar: "some updated avatar", email: "some updated email", facebook: "some updated facebook", kind: "some updated kind", landline: "some updated landline", latitude: "456.7", longitude: "456.7", mobile: "some updated mobile", name: "some updated name", slogan: "some updated slogan"}
    @invalid_attrs %{address: nil, avatar: nil, email: nil, facebook: nil, kind: nil, landline: nil, latitude: nil, longitude: nil, mobile: nil, name: nil, slogan: nil}

    def hub_fixture(attrs \\ %{}) do
      {:ok, hub} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Orgs.create_hub()

      hub
    end

    test "list_hubs/0 returns all hubs" do
      hub = hub_fixture()
      assert Orgs.list_hubs() == [hub]
    end

    test "get_hub!/1 returns the hub with given id" do
      hub = hub_fixture()
      assert Orgs.get_hub!(hub.id) == hub
    end

    test "create_hub/1 with valid data creates a hub" do
      assert {:ok, %Hub{} = hub} = Orgs.create_hub(@valid_attrs)
      assert hub.address == "some address"
      assert hub.avatar == "some avatar"
      assert hub.email == "some email"
      assert hub.facebook == "some facebook"
      assert hub.kind == "some kind"
      assert hub.landline == "some landline"
      assert hub.latitude == Decimal.new("120.5")
      assert hub.longitude == Decimal.new("120.5")
      assert hub.mobile == "some mobile"
      assert hub.name == "some name"
      assert hub.slogan == "some slogan"
    end

    test "create_hub/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Orgs.create_hub(@invalid_attrs)
    end

    test "update_hub/2 with valid data updates the hub" do
      hub = hub_fixture()
      assert {:ok, %Hub{} = hub} = Orgs.update_hub(hub, @update_attrs)
      assert hub.address == "some updated address"
      assert hub.avatar == "some updated avatar"
      assert hub.email == "some updated email"
      assert hub.facebook == "some updated facebook"
      assert hub.kind == "some updated kind"
      assert hub.landline == "some updated landline"
      assert hub.latitude == Decimal.new("456.7")
      assert hub.longitude == Decimal.new("456.7")
      assert hub.mobile == "some updated mobile"
      assert hub.name == "some updated name"
      assert hub.slogan == "some updated slogan"
    end

    test "update_hub/2 with invalid data returns error changeset" do
      hub = hub_fixture()
      assert {:error, %Ecto.Changeset{}} = Orgs.update_hub(hub, @invalid_attrs)
      assert hub == Orgs.get_hub!(hub.id)
    end

    test "delete_hub/1 deletes the hub" do
      hub = hub_fixture()
      assert {:ok, %Hub{}} = Orgs.delete_hub(hub)
      assert_raise Ecto.NoResultsError, fn -> Orgs.get_hub!(hub.id) end
    end

    test "change_hub/1 returns a hub changeset" do
      hub = hub_fixture()
      assert %Ecto.Changeset{} = Orgs.change_hub(hub)
    end
  end

  describe "companies" do
    alias Pantry.Orgs.Company

    @valid_attrs %{address: "some address", email: "some email", landline: "some landline", mobile: "some mobile", name: "some name"}
    @update_attrs %{address: "some updated address", email: "some updated email", landline: "some updated landline", mobile: "some updated mobile", name: "some updated name"}
    @invalid_attrs %{address: nil, email: nil, landline: nil, mobile: nil, name: nil}

    def company_fixture(attrs \\ %{}) do
      {:ok, company} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Orgs.create_company()

      company
    end

    test "list_companies/0 returns all companies" do
      company = company_fixture()
      assert Orgs.list_companies() == [company]
    end

    test "get_company!/1 returns the company with given id" do
      company = company_fixture()
      assert Orgs.get_company!(company.id) == company
    end

    test "create_company/1 with valid data creates a company" do
      assert {:ok, %Company{} = company} = Orgs.create_company(@valid_attrs)
      assert company.address == "some address"
      assert company.email == "some email"
      assert company.landline == "some landline"
      assert company.mobile == "some mobile"
      assert company.name == "some name"
    end

    test "create_company/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Orgs.create_company(@invalid_attrs)
    end

    test "update_company/2 with valid data updates the company" do
      company = company_fixture()
      assert {:ok, %Company{} = company} = Orgs.update_company(company, @update_attrs)
      assert company.address == "some updated address"
      assert company.email == "some updated email"
      assert company.landline == "some updated landline"
      assert company.mobile == "some updated mobile"
      assert company.name == "some updated name"
    end

    test "update_company/2 with invalid data returns error changeset" do
      company = company_fixture()
      assert {:error, %Ecto.Changeset{}} = Orgs.update_company(company, @invalid_attrs)
      assert company == Orgs.get_company!(company.id)
    end

    test "delete_company/1 deletes the company" do
      company = company_fixture()
      assert {:ok, %Company{}} = Orgs.delete_company(company)
      assert_raise Ecto.NoResultsError, fn -> Orgs.get_company!(company.id) end
    end

    test "change_company/1 returns a company changeset" do
      company = company_fixture()
      assert %Ecto.Changeset{} = Orgs.change_company(company)
    end
  end
end
