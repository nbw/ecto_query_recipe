defmodule MyApp.Business do
  @doc false

  alias MyApp.Business.OrganizationRepo

  defdelegate get_organization!(id, opts \\ []), to: OrganizationRepo

  defdelegate create_organization(attrs), to: OrganizationRepo
end
