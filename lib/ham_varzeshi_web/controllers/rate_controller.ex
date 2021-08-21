defmodule HamVarzeshiWeb.RateController do
  use HamVarzeshiWeb, :controller

  alias HamVarzeshi.App.Gym
  alias HamVarzeshi.Repo

  def index(conn,  %{"id" => gym_id} ) do
    render(conn, "index.html" , gym_id: gym_id)
  end

  def doRate(conn , %{"id" => gym_id , "for" => rate}) do
    old_gym = Gym
    |> Repo.get!(gym_id)

    changeset = cond do
      old_gym.rating == nil ->
        r=rate
        c=1
      Gym.changeset(old_gym , %{"rating" => r , "counter" =>c})
      true ->
        r = (old_gym.rating * old_gym.counter) + rate
        c = old_gym.counter + 1
      Gym.changeset(old_gym , %{"rating" => r , "counter" =>c})
    end

    case Repo.update(changeset) do

      {:ok , _params } ->

        conn
        |> put_flash(:info , "successfully rated.")
        |> redirect(to: Routes.gym_path(conn, :index))

      {:error , res} ->
        conn
        |> put_flash(:error , res )
        |> redirect(to: Routes.gym_path(conn, :index))


    end


  end

end
