defmodule Pantry.Orgs do
  @moduledoc """
  The Orgs context.
  """

  import Ecto.Query, warn: false
  alias Pantry.Repo

  alias Pantry.Orgs.Hub

  @doc """
  Returns the list of hubs.

  ## Examples

      iex> list_hubs()
      [%Hub{}, ...]

  """
  def list_hubs do
    Repo.all(Hub)
  end

  @doc """
  Gets a single hub.

  Raises `Ecto.NoResultsError` if the Hub does not exist.

  ## Examples

      iex> get_hub!(123)
      %Hub{}

      iex> get_hub!(456)
      ** (Ecto.NoResultsError)

  """
  def get_hub!(id), do: Repo.get!(Hub, id)

  @doc """
  Creates a hub.

  ## Examples

      iex> create_hub(%{field: value})
      {:ok, %Hub{}}

      iex> create_hub(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_hub(attrs \\ %{}) do
    %Hub{}
    |> Hub.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a hub.

  ## Examples

      iex> update_hub(hub, %{field: new_value})
      {:ok, %Hub{}}

      iex> update_hub(hub, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_hub(%Hub{} = hub, attrs) do
    hub
    |> Hub.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a hub.

  ## Examples

      iex> delete_hub(hub)
      {:ok, %Hub{}}

      iex> delete_hub(hub)
      {:error, %Ecto.Changeset{}}

  """
  def delete_hub(%Hub{} = hub) do
    Repo.delete(hub)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking hub changes.

  ## Examples

      iex> change_hub(hub)
      %Ecto.Changeset{data: %Hub{}}

  """
  def change_hub(%Hub{} = hub, attrs \\ %{}) do
    Hub.changeset(hub, attrs)
  end
end