defmodule MyApp.BusinessFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MyApp.Business` context.
  """

  @doc """
  Generate a organization.
  """
  def organization_fixture(attrs \\ %{}) do
    {:ok, organization} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> MyApp.Business.create_organization()

    organization
  end
end
