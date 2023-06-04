defmodule ExMon.Trainer.Delete do
  @moduledoc false
  alias ExMon.{Repo, Trainer}
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
    :error -> {:error, "Invalid UUID"}
    {:ok, uuid} -> delete(uuid)
    end
  end

  defp delete(uuid) do
    case fetch_trainer(uuid) do
    nil -> {:error, %{status: 404, message: "Trainer not found"}}
    trainer -> Repo.delete(trainer)
    end
  end

  defp fetch_trainer(uuid), do: Repo.get(Trainer, uuid)
end
