defmodule MyApp.Accounts do
  @moduledoc """
  Everything accounts
  """
  alias MyApp.Accounts.UserRepo
  alias MyApp.Business

  use MyApp.Query

  def list_active_users do
    UserRepo.list_users(where: [active: true])
  end

  def list_users_for_organization(organization_id) do
    Business.get_organization!(organization_id, preload: [:users])
    |> Map.get(:users)
  end

  def list_users_for_select_dropdown(limit \\ 100) do
    UserRepo.list_users(
      select: [:id, :name],
      where: [active: true],
      order_by: {:desc, :id},
      limit: limit
    )
    |> Enum.map(&{&1.name, &1.id})
  end

  defdelegate create_user(organization, attrs), to: UserRepo
end
