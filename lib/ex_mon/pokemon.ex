defmodule ExMon.Pokemon do
  @moduledoc false

  @key [:id, :name, :weight, :types]

  @enforce_keys @key

  @derive Jason.Encoder
  defstruct @key

  def build(%{"id" => id, "name" => name, "weight" => weight, "types" => types}) do
    %__MODULE__{
      id: id,
      name: name,
      weight: weight,
      types: parse_types(types)
    }
  end

  defp parse_types(types), do: Enum.map(types, fn item -> item["type"]["name"] end)
end
