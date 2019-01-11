defmodule EbcWebapp.PublicationTest do
  use EbcWebapp.DataCase

  alias EbcWebapp.Publication

  describe "posts" do
    alias EbcWebapp.Publication.Post

    @valid_attrs %{body: "some body", publication_date: ~N[2010-04-17 14:00:00], title: "some title"}
    @update_attrs %{body: "some updated body", publication_date: ~N[2011-05-18 15:01:01], title: "some updated title"}
    @invalid_attrs %{body: nil, publication_date: nil, title: nil}

    def post_fixture(attrs \\ %{}) do
      {:ok, post} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Publication.create_post()

      post
    end

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert Publication.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert Publication.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      assert {:ok, %Post{} = post} = Publication.create_post(@valid_attrs)
      assert post.body == "some body"
      assert post.publication_date == ~N[2010-04-17 14:00:00]
      assert post.title == "some title"
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Publication.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      assert {:ok, %Post{} = post} = Publication.update_post(post, @update_attrs)
      assert post.body == "some updated body"
      assert post.publication_date == ~N[2011-05-18 15:01:01]
      assert post.title == "some updated title"
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Publication.update_post(post, @invalid_attrs)
      assert post == Publication.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = Publication.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Publication.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = Publication.change_post(post)
    end
  end
end
