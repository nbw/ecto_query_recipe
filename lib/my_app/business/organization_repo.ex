defmodule MyApp.Business.OrganizationRepo do
  @moduledoc """
  The Business context.
  """

  use MyApp.Query
  alias MyApp.Repo

  alias MyApp.Business.Organization

  @doc """
  Returns the list of organizations.
  """
  def list_organizations(opts \\ []) do
    query(Organization, opts)
    |> Repo.all()
  end

  @doc """
  Gets a single organization.
  """
  def get_organization!(id, opts \\ []) do
    query(Organization, opts)
    |> Repo.get!(id)
  end

  @doc """
  Creates a organization.
  """
  def create_organization(attrs \\ %{}) do
    %Organization{}
    |> Organization.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a organization.
  """
  def update_organization(%Organization{} = organization, attrs) do
    organization
    |> Organization.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a organization.
  """
  def delete_organization(%Organization{} = organization) do
    Repo.delete(organization)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking organization changes.
  """
  def change_organization(%Organization{} = organization, attrs \\ %{}) do
    Organization.changeset(organization, attrs)
  end
end
