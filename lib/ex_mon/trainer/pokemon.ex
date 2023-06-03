defmodule ExMon.Trainer.Pokemon do
  @moduledoc false

  alias ExMon.Trainer

  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID
  @required_params [:name, :nickname, :weight, :types, :trainer_id]

  schema "pokemons" do
    field :name, :string
    field :nickname, :string
    field :weight, :integer
    field :types, {:array, :string}
    belongs_to :trainer, Trainer
    timestamps()
  end

  def build(params) do
    params
    |> changeset()
    |> apply_action(:insert)
  end

  defp changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> assoc_constraint(:trainer)
    |> validate_length(:nickname, min: 3)
  end

end
