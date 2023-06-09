defmodule ExMon.Trainer.Pokemon.Get do
  @moduledoc false

  alias ExMon.{Trainer.Pokemon, Repo}
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID Format"}
      {:ok, uuid} -> get(uuid)
    end
  end

  defp get(uuid) do
    case Repo.get(Pokemon, uuid) do
      nil -> {:error, %{status: 404, message: "Pokemon not found"}}
      pokemon -> {:ok, Repo.preload(pokemon, :trainer)}
    end
  end
end
