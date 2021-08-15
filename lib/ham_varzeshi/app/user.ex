defmodule HamVarzeshi.App.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :avatar, :string
    field :email, :string
    field :name, :string
    field :provider, :string
    field :token, :string

    has_many :gyms, HamVarzeshi.App.Gym

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [ :email, :provider,:token])
    |> validate_required([ :email, :provider,:token])
  end
end
