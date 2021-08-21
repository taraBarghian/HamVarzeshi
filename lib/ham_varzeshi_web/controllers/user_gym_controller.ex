defmodule HamVarzeshiWeb.UserGymController do
  use HamVarzeshiWeb, :controller

  import Ecto
  alias HamVarzeshi.Repo
  alias HamVarzeshi.App.UserGym
  alias HamVarzeshi.App.Gym

  def index(conn, %{"id" => gym_id}) do
    gym = Repo.get(Gym, gym_id)
    changeset= UserGym.changeset(%UserGym{},%{})
    render(conn, "index.html", changeset: changeset , gym: gym)
  end

  def reserve(conn, %{"id" => gym_id , "day" => day, "time"=> time} = params) do

    changeset = UserGym.changeset(%UserGym{},%{gym_id: gym_id, user_id: conn.assigns.user.id , day: day , time: time})
    case Repo.insert(changeset) do
      {:ok, _param} ->
        conn
        |> put_flash(:info , "successfully reserved.")
        |> redirect(to: Routes.gym_path(conn, :index))

      {:error, reason} ->
        conn
        |> put_flash(:error , "an error occurs!")
        |> redirect(to: Routes.gym_path(conn, :index))

    end



  end

end
