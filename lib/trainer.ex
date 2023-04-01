defmodule ExMon.Trainer do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "trainers" do
    field :name, :string
    field :password_hash, :string

    timestamps()
  end

  @required_parms [:name, :password_hash]
  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_parms)
    |> validate_required(@required_parms)
  end
end
