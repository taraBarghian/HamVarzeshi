defmodule HamVarzeshiWeb.GymController do
  use HamVarzeshiWeb, :controller

  import Ecto
  import HamVarzeshi.Repo
  alias HamVarzeshi.App
  alias HamVarzeshi.App.Gym
  alias HamVarzeshi.App.UserGym

  plug HamVarzeshiWeb.Plugs.RequireAuth when action in [:new, :create , :update , :edit , :delete]

  def index(conn, _params) do
    gyms = App.list_gyms()
    render(conn, "index.html", gyms: gyms)
  end

  def new(conn, _params) do
    changeset = App.change_gym(%Gym{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"gym" => gym_params}) do

    user = conn.assigns.user


    cond do
     user == nil ->
          conn
          |> put_flash(:error, "nili baba.")
          |> redirect(to: Routes.gym_path(conn, :index ,gym_params))
      true ->
        gym_user = user
        |> Ecto.build_assoc(:gyms)
      case App.create_gym(gym_user,gym_params) do
        {:ok, gym} ->
          conn
          |> put_flash(:info, "Gym created successfully.")
          |> redirect(to: Routes.gym_path(conn, :show, gym))

        {:error, %Ecto.Changeset{} = changeset} ->
          render(conn, "new.html", changeset: changeset)
      end
    end

  end

  def show(conn, %{"id" => id}) do
    gym = App.get_gym!(id)
    render(conn, "show.html", gym: gym)
  end

  def edit(conn, %{"id" => id}) do
    gym = App.get_gym!(id)
    changeset = App.change_gym(gym)
    render(conn, "edit.html", gym: gym, changeset: changeset)
  end

  def update(conn, %{"id" => id, "gym" => gym_params}) do
    gym = App.get_gym!(id)

    case App.update_gym(gym, gym_params) do
      {:ok, gym} ->
        conn
        |> put_flash(:info, "Gym updated successfully.")
        |> redirect(to: Routes.gym_path(conn, :show, gym))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", gym: gym, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    gym = App.get_gym!(id)
    {:ok, _gym} = App.delete_gym(gym)

    conn
    |> put_flash(:info, "Gym deleted successfully.")
    |> redirect(to: Routes.gym_path(conn, :index))
  end


  def reserve(conn, %{"id" => id, "user_gym_params" => user_gym_params}) do
    user_gym = App.get_user_gym!(id)

    case App.reserve_gym(user_gym, user_gym_params) do
      {:ok, user_gym} ->
        conn
        |> put_flash(:info, "Gym reserved successfully.")
        |> redirect(to: Routes.gym_path(conn, :show, user_gym))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", user_gym: user_gym, changeset: changeset)
    end

  end


end
