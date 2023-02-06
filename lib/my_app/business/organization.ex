defmodule MyApp.Business.Organization do
  use Ecto.Schema
  import Ecto.Changeset

  alias MyApp.Accounts.User

  schema "organizations" do
    field :name, :string

    has_many :users, User

    timestamps()
  end

  @doc false
  def changeset(organization, attrs) do
    organization
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
