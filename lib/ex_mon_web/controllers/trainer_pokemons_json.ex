defmodule ExMonWeb.Controllers.TrainerPokemons do
  @moduledoc false

  alias ExMon.Trainer.Pokemon
  def render("create.json", %{
    pokemon: %Pokemon{
      id: id,
      name: name,
      nickname: nickname,
      types: types,
      trainer_id: trainer_id,
      weight: weight,
      inserted_at: inserted_at
    }
  }) do
    %{
      message: "Pokemon created successfully",
      pokemon: %{
        id: id,
        name: name,
        nickname: nickname,
        types: types,
        trainer_id: trainer_id,
        weight: weight,
        inserted_at: inserted_at
      }
    }
  end
end
