defmodule ExMon.Pokemon do
  @moduledoc false

  @key [:id, :name, :wight, :types]

  @enforce_keys @key

  defstruct @key

  def build(%{"id" => id, "name" => name, "wight" => wight, "types" => types}) do
    %__MODULE__{
      id: id,
      name: name,
      wight: wight,
      types: parse_types(types)
    }
  end

  defp parse_types(types), do: Enum.map(types, fn item -> item["type"]["name"] end)
end
