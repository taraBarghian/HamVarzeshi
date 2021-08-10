defmodule HamVarzeshi.AppTest do
  use HamVarzeshi.DataCase

  alias HamVarzeshi.App

  describe "gyms" do
    alias HamVarzeshi.App.Gym

    @valid_attrs %{avatar: "some avatar", description: "some description", name: "some name"}
    @update_attrs %{avatar: "some updated avatar", description: "some updated description", name: "some updated name"}
    @invalid_attrs %{avatar: nil, description: nil, name: nil}

    def gym_fixture(attrs \\ %{}) do
      {:ok, gym} =
        attrs
        |> Enum.into(@valid_attrs)
        |> App.create_gym()

      gym
    end

    test "list_gyms/0 returns all gyms" do
      gym = gym_fixture()
      assert App.list_gyms() == [gym]
    end

    test "get_gym!/1 returns the gym with given id" do
      gym = gym_fixture()
      assert App.get_gym!(gym.id) == gym
    end

    test "create_gym/1 with valid data creates a gym" do
      assert {:ok, %Gym{} = gym} = App.create_gym(@valid_attrs)
      assert gym.avatar == "some avatar"
      assert gym.description == "some description"
      assert gym.name == "some name"
    end

    test "create_gym/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = App.create_gym(@invalid_attrs)
    end

    test "update_gym/2 with valid data updates the gym" do
      gym = gym_fixture()
      assert {:ok, %Gym{} = gym} = App.update_gym(gym, @update_attrs)
      assert gym.avatar == "some updated avatar"
      assert gym.description == "some updated description"
      assert gym.name == "some updated name"
    end

    test "update_gym/2 with invalid data returns error changeset" do
      gym = gym_fixture()
      assert {:error, %Ecto.Changeset{}} = App.update_gym(gym, @invalid_attrs)
      assert gym == App.get_gym!(gym.id)
    end

    test "delete_gym/1 deletes the gym" do
      gym = gym_fixture()
      assert {:ok, %Gym{}} = App.delete_gym(gym)
      assert_raise Ecto.NoResultsError, fn -> App.get_gym!(gym.id) end
    end

    test "change_gym/1 returns a gym changeset" do
      gym = gym_fixture()
      assert %Ecto.Changeset{} = App.change_gym(gym)
    end
  end

  describe "users" do
    alias HamVarzeshi.App.User

    @valid_attrs %{avatar: "some avatar", email: "some email", name: "some name"}
    @update_attrs %{avatar: "some updated avatar", email: "some updated email", name: "some updated name"}
    @invalid_attrs %{avatar: nil, email: nil, name: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> App.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert App.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert App.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = App.create_user(@valid_attrs)
      assert user.avatar == "some avatar"
      assert user.email == "some email"
      assert user.name == "some name"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = App.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = App.update_user(user, @update_attrs)
      assert user.avatar == "some updated avatar"
      assert user.email == "some updated email"
      assert user.name == "some updated name"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = App.update_user(user, @invalid_attrs)
      assert user == App.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = App.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> App.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = App.change_user(user)
    end
  end
end
