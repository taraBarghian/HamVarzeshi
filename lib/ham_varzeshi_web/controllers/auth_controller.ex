defmodule HamVarzeshiWeb.AuthController do
  use HamVarzeshiWeb, :controller
  plug Ueberauth

  alias HamVarzeshi.App.User
  alias HamVarzeshi.Repo


  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    user_params = %{
      token: auth.credentials.token,
      email: auth.info.email,
      provider: "google"}

      changeset= User.changeset(%User{}, user_params)
      signin(conn,changeset)
  end


  defp signin(conn, changeset) do
    case insert_update_user(changeset) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Welcome ...")
        |> put_session(:user_id , user.id)
        |> redirect(to: Routes.gym_path(conn,:index))

      {:error, _reason}->
        conn
        |> put_flash(:error, "Error in signing in")
        |> redirect(to: Routes.gym_path(conn,:index))
    end
  end


  defp insert_update_user(changeset) do
   case Repo.get_by(User, email: changeset.changes.email) do

    nil ->
      Repo.insert(changeset)

    user ->
      {:ok,user}

   end
  end

  def signout(conn, _params) do
    conn
    |> configure_session(drop: true)
    |> redirect(to: Routes.gym_path(conn, :index))
  end


end
