defmodule MyApp.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MyApp.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        active: true,
        email: "some email",
        name: "some name"
      })
      |> MyApp.Accounts.create_user()

    user
  end
end
