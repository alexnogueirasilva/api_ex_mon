defmodule ExMon.Trainer.Pokemon.Update do
  @moduledoc false

  alias ExMon.{Trainer.Pokemon, Repo}
  alias Ecto.UUID

  def call(%{"id" => uuid} = params) do
    case UUID.cast(uuid) do
      :error -> {:error, "Invalid ID Format"}
      {:ok, _uuid} -> update(params)
    end
  end

  defp update(%{"id" => uuid} = params) do
    case Repo.get(Pokemon, uuid) do
      nil -> {:error, %{status: 404, message: "Pokemon not found"}}
      pokemon -> update_pokemon(pokemon, params)
    end
  end

  defp update_pokemon(pokemon, params) do
    pokemon
    |> Pokemon.update_changeset(params)
    |> Repo.update()
  end
end
