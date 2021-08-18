defmodule HamVarzeshiWeb.UserGymController do
  use HamVarzeshiWeb, :controller

  import Ecto
  alias HamVarzeshi.Repo
  alias HamVarzeshi.App.UserGym

  def reserve(conn, %{"id" => gym_id}) do
    # user_gym = App.get_user_gym!(id)

    changeset = UserGym.changeset(%UserGym{},%{gym_id: gym_id, user_id: conn.assigns.user.id } )

    case Repo.insert(changeset) do
      {:ok, _param} ->
        conn
        |> put_flash(:info , "khar b to an")
        |> redirect(to: Routes.gym_path(conn, :index))

      {:error, reason} ->
        conn
        |> put_flash(:erro , "khar b to an tarin an")
        |> redirect(to: Routes.gym_path(conn, :index))

    end






  end

end
