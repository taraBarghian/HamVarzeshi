defmodule HamVarzeshiWeb.GymController do
  use HamVarzeshiWeb, :controller


  import Ecto.Query
  alias HamVarzeshi.Repo
  alias HamVarzeshi.App
  alias HamVarzeshi.App.Gym
  alias HamVarzeshi.App.User
  alias HamVarzeshi.App.UserGym


  plug HamVarzeshiWeb.Plugs.RequireAuth when action in [:new, :create , :update , :edit , :delete]

  def index(conn, _params) do
    gyms = App.list_gyms()
    render(conn, "index.html", gyms: gyms)
  end

  def new(conn, _params) do
    changeset = App.change_gym(%Gym{}, %{})
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

    {intId, ""} = Integer.parse(id)
    query = from ug in "user_gym",
    where: ug.gym_id == ^intId,
    select: ug.user_id,
    order_by: ug.time

    ug = Repo.all(query)
    users = get_ugs(ug)

    IO.puts("*************************************")
    IO.inspect(users)

    gym = App.get_gym!(id)
    render(conn, "show.html", gym: gym, users: users)
  end

  defp get_ugs(ugs) do
    list = for ug <- ugs do
       user = Repo.all(
        from(user in User ,
        where: user.id == ^ug)
      )
      [user_item] = user
      user_item
    end
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
