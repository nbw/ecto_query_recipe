defmodule MyApp.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias MyApp.Business.Organization

  @require ~w(name email active)a
  @cast ~w(name email active)a

  schema "users" do
    field :active, :boolean, default: true
    field :email, :string
    field :name, :string

    belongs_to :organization, Organization

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, @cast)
    |> validate_required(@require)
  end

  def create_changeset(user, organization, attrs) do
    user
    |> cast(attrs, @cast)
    |> validate_required(@require)
    |> put_assoc(:organization, organization)
  end
end
