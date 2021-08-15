defmodule HamVarzeshi.App do
  @moduledoc """
  The App context.
  """

  import Ecto.Query, warn: false
  import Ecto

  alias HamVarzeshi.Repo
  alias HamVarzeshi.App.Gym
  alias HamVarzeshi.App.UserGym
  alias HamVarzeshi.App.User
  @doc """
  Returns the list of gyms.

  ## Examples

      iex> list_gyms()
      [%Gym{}, ...]

  """
  def list_gyms do
    Repo.all(Gym)
  end

  @doc """
  Gets a single gym.

  Raises `Ecto.NoResultsError` if the Gym does not exist.

  ## Examples

      iex> get_gym!(123)
      %Gym{}

      iex> get_gym!(456)
      ** (Ecto.NoResultsError)

  """
  def get_gym!(id), do: Repo.get!(Gym, id)

  @doc """
  Creates a gym.

  ## Examples

      iex> create_gym(%{field: value})
      {:ok, %Gym{}}

      iex> create_gym(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_gym(gym ,attrs \\ %{}) do
    gym
    |> Gym.changeset(attrs)
    |> Repo.insert()
  end


  @doc """
  Updates a gym.

  ## Examples

      iex> update_gym(gym, %{field: new_value})
      {:ok, %Gym{}}

      iex> update_gym(gym, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_gym(%Gym{} = gym, attrs) do
    gym
    |> Gym.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a gym.

  ## Examples

      iex> delete_gym(gym)
      {:ok, %Gym{}}

      iex> delete_gym(gym)
      {:error, %Ecto.Changeset{}}

  """
  def delete_gym(%Gym{} = gym) do
    Repo.delete(gym)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking gym changes.

  ## Examples

      iex> change_gym(gym)
      %Ecto.Changeset{data: %Gym{}}

  """
  def change_gym(%Gym{} = gym, attrs \\ %{}) do
    Gym.changeset(gym, attrs)
  end


  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{data: %User{}}

  """
  def change_user(%User{} = user, attrs \\ %{}) do
    User.changeset(user, attrs)
  end


  def reserve_gym(user_gym ,attrs \\ %{}) do
    user_gym
    |>UserGym.changeset(attrs)
    |> Repo.insert()
  end

  def get_user_gym!(id), do: Repo.get!(UserGym, id)

end
