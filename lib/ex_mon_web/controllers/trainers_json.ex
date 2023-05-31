defmodule ExMonWeb.TrainersJSON do
  @moduledoc false

  alias ExMon.Trainer

  def render("create.json", %{trainer: %Trainer{id: id, name: name, inserted_at: inserted_at}}) do
    %{
      message: "Create trainers",
      trainer: %{
      id: id,
      name: name,
      inserted_at: inserted_at,
      }
    }
  end

  def render("show.json", %{trainer: %Trainer{id: id, name: name, inserted_at: inserted_at}}) do
    %{
        id: id,
        name: name,
        inserted_at: inserted_at,
    }
  end

end
