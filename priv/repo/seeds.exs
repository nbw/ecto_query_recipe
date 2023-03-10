# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     MyApp.Repo.insert!(%MyApp.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

{:ok, org} = MyApp.Business.create_organization(%{name: "Fly"})
{:ok, _user} = MyApp.Accounts.create_user(org, %{name: "Nathan", email: "nathan@test.com"})
