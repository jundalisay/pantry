defmodule Pantry.FeedTest do
  use Pantry.DataCase

  alias Pantry.Feed

  describe "posts" do
    alias Pantry.Feed.Post

    @valid_attrs %{content: "some content", kind: "some kind", username: "some username", userpic: "some userpic"}
    @update_attrs %{content: "some updated content", kind: "some updated kind", username: "some updated username", userpic: "some updated userpic"}
    @invalid_attrs %{content: nil, kind: nil, username: nil, userpic: nil}

    def post_fixture(attrs \\ %{}) do
      {:ok, post} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Feed.create_post()

      post
    end

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert Feed.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert Feed.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      assert {:ok, %Post{} = post} = Feed.create_post(@valid_attrs)
      assert post.content == "some content"
      assert post.kind == "some kind"
      assert post.username == "some username"
      assert post.userpic == "some userpic"
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Feed.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      assert {:ok, %Post{} = post} = Feed.update_post(post, @update_attrs)
      assert post.content == "some updated content"
      assert post.kind == "some updated kind"
      assert post.username == "some updated username"
      assert post.userpic == "some updated userpic"
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Feed.update_post(post, @invalid_attrs)
      assert post == Feed.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = Feed.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Feed.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = Feed.change_post(post)
    end
  end
end
