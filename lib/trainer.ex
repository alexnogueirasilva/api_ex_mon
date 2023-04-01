defmodule ExMon.Trainer do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "trainers" do
    field :name, :string
    field :password_hash, :string
    field :password, :string, virtual: true

    timestamps()
  end

  @required_parms [:name, :password]
  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_parms)
    |> validate_required(@required_parms)
    |> validate_length(:password, min: 8)
    |> put_pass_hash()
  end

  defp put_pass_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Argon2.add_hash(password))
  end

  defp put_pass_hash(changeset), do: changeset

end
