defmodule HamVarzeshiWeb.GymController do
  use HamVarzeshiWeb, :controller

  alias HamVarzeshi.App
  alias HamVarzeshi.App.Gym

  def index(conn, _params) do
    gyms = App.list_gyms()
    render(conn, "index.html", gyms: gyms)
  end

  def new(conn, _params) do
    changeset = App.change_gym(%Gym{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"gym" => gym_params}) do
    case App.create_gym(gym_params) do
      {:ok, gym} ->
        conn
        |> put_flash(:info, "Gym created successfully.")
        |> redirect(to: Routes.gym_path(conn, :show, gym))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
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
end
