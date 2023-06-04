defmodule ExMonWeb.TrainerPokemonsJSON do
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

  def render("show.json", %{pokemon: %Pokemon{
    id: id,
    name: name,
    nickname: nickname,
    types: types,
    weight: weight,
    inserted_at: inserted_at,
    trainer: %{
      id: trainer_id,
      name: trainer_name,
      inserted_at: trainer_inserted_at
    }
  }}) do
    %{
      pokemon: %{
        id: id,
        name: name,
        nickname: nickname,
        types: types,
        weight: weight,
        inserted_at: inserted_at,
        trainer: %{
          id: trainer_id,
          name: trainer_name,
          inserted_at: trainer_inserted_at
        }
      }
    }
  end

  def render("update.json", %{
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
      message: "Pokemon updated successfully",
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
