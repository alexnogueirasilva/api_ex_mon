defmodule ExMonWeb.TrainersJSON do
  @moduledoc false

  alias ExMonWeb.Trainer

  def render(create, %{trainers: trainers}) do
    %{
      message: "Create trainers",
    }
  end

  defp render_many(list, module, view) do
    Enum.map(list, &module.render(view, &1))
  end
end
