defmodule ExMonWeb.TrainersJSON do
  @moduledoc false

  alias ExMon.Trainer

  def render(create, %{trainer: %Trainer{id: id, name: name, inserted_at: inserted_at}}) do
    %{
      message: "Create trainers",
      trainer: %{
      id: id,
      name: name,
      inserted_at: inserted_at,
      }
    }
  end

  defp render_many(list, module, view) do
    Enum.map(list, &module.render(view, &1))
  end
end
