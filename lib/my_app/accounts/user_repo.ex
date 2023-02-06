defmodule MyApp.Accounts.UserRepo do
  @moduledoc """
  The Accounts context.
  """

  use MyApp.Query
  alias MyApp.Repo

  alias MyApp.Accounts.User

  @doc """
  Returns the list of users.
  """
  def list_users(opts \\ []) do
    query(User, opts)
    |> Repo.all()
  end

  @doc """
  Gets a single user.
  """
  def get_user!(id, opts \\ []) do
    query(User, opts)
    |> Repo.get!(id)
  end

  @doc """
  Gets a single user.
  """
  def get_one_user(opts \\ []) do
    query(User, opts)
    |> Repo.one()
  end

  @doc """
  Creates a user.
  """
  def create_user(organization, attrs \\ %{}) do
    %User{}
    |> User.create_changeset(organization, attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.
  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user.
  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.
  """
  def change_user(%User{} = user, attrs \\ %{}) do
    User.changeset(user, attrs)
  end
end
