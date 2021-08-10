defmodule HamVarzeshiWeb.GymControllerTest do
  use HamVarzeshiWeb.ConnCase

  alias HamVarzeshi.App

  @create_attrs %{avatar: "some avatar", description: "some description", name: "some name"}
  @update_attrs %{avatar: "some updated avatar", description: "some updated description", name: "some updated name"}
  @invalid_attrs %{avatar: nil, description: nil, name: nil}

  def fixture(:gym) do
    {:ok, gym} = App.create_gym(@create_attrs)
    gym
  end

  describe "index" do
    test "lists all gyms", %{conn: conn} do
      conn = get(conn, Routes.gym_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Gyms"
    end
  end

  describe "new gym" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.gym_path(conn, :new))
      assert html_response(conn, 200) =~ "New Gym"
    end
  end

  describe "create gym" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.gym_path(conn, :create), gym: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.gym_path(conn, :show, id)

      conn = get(conn, Routes.gym_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Gym"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.gym_path(conn, :create), gym: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Gym"
    end
  end

  describe "edit gym" do
    setup [:create_gym]

    test "renders form for editing chosen gym", %{conn: conn, gym: gym} do
      conn = get(conn, Routes.gym_path(conn, :edit, gym))
      assert html_response(conn, 200) =~ "Edit Gym"
    end
  end

  describe "update gym" do
    setup [:create_gym]

    test "redirects when data is valid", %{conn: conn, gym: gym} do
      conn = put(conn, Routes.gym_path(conn, :update, gym), gym: @update_attrs)
      assert redirected_to(conn) == Routes.gym_path(conn, :show, gym)

      conn = get(conn, Routes.gym_path(conn, :show, gym))
      assert html_response(conn, 200) =~ "some updated avatar"
    end

    test "renders errors when data is invalid", %{conn: conn, gym: gym} do
      conn = put(conn, Routes.gym_path(conn, :update, gym), gym: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Gym"
    end
  end

  describe "delete gym" do
    setup [:create_gym]

    test "deletes chosen gym", %{conn: conn, gym: gym} do
      conn = delete(conn, Routes.gym_path(conn, :delete, gym))
      assert redirected_to(conn) == Routes.gym_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.gym_path(conn, :show, gym))
      end
    end
  end

  defp create_gym(_) do
    gym = fixture(:gym)
    %{gym: gym}
  end
end
