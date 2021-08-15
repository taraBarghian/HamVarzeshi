defmodule HamVarzeshiWeb.UserGymController do
  use HamVarzeshiWeb, :controller

  import Ecto
  import HamVarzeshi.Repo
  alias HamVarzeshi.App

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
