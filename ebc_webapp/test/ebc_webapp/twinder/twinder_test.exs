defmodule EbcWebapp.TwinderTest do
  use EbcWebapp.DataCase

  alias EbcWebapp.Twinder

  describe "users" do
    alias EbcWebapp.Twinder.User

    @valid_attrs %{born_date: ~D[2010-04-17], email: "some email", full_name: "some full_name", username: "some username"}
    @update_attrs %{born_date: ~D[2011-05-18], email: "some updated email", full_name: "some updated full_name", username: "some updated username"}
    @invalid_attrs %{born_date: nil, email: nil, full_name: nil, username: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Twinder.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Twinder.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Twinder.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Twinder.create_user(@valid_attrs)
      assert user.born_date == ~D[2010-04-17]
      assert user.email == "some email"
      assert user.full_name == "some full_name"
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Twinder.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Twinder.update_user(user, @update_attrs)
      assert user.born_date == ~D[2011-05-18]
      assert user.email == "some updated email"
      assert user.full_name == "some updated full_name"
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Twinder.update_user(user, @invalid_attrs)
      assert user == Twinder.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Twinder.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Twinder.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Twinder.change_user(user)
    end
  end

  describe "posts" do
    alias EbcWebapp.Twinder.Post

    @valid_attrs %{body: "some body", publication_date: ~N[2010-04-17 14:00:00], title: "some title"}
    @update_attrs %{body: "some updated body", publication_date: ~N[2011-05-18 15:01:01], title: "some updated title"}
    @invalid_attrs %{body: nil, publication_date: nil, title: nil}

    def post_fixture(attrs \\ %{}) do
      {:ok, post} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Twinder.create_post()

      post
    end

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert Twinder.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert Twinder.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      assert {:ok, %Post{} = post} = Twinder.create_post(@valid_attrs)
      assert post.body == "some body"
      assert post.publication_date == ~N[2010-04-17 14:00:00]
      assert post.title == "some title"
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Twinder.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      assert {:ok, %Post{} = post} = Twinder.update_post(post, @update_attrs)
      assert post.body == "some updated body"
      assert post.publication_date == ~N[2011-05-18 15:01:01]
      assert post.title == "some updated title"
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Twinder.update_post(post, @invalid_attrs)
      assert post == Twinder.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = Twinder.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Twinder.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = Twinder.change_post(post)
    end
  end
end
