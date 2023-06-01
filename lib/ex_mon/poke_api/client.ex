defmodule ExMon.PokeAPI.Client do
  @moduledoc false
  use Tesla
  @base_url "https://pokeapi.co/api/v2"

  plug Tesla.Middleware.BaseUrl, @base_url
  plug Tesla.Middleware.JSON

  def get_pokemon(name) do
    "/pokemon/#{name}"
    |> get()
    |> handle_get()
  end

  defp handle_get(:ok, %Tesla.Env{status: 200, body: body}), do: {:ok, body}
  defp handle_get(:ok, %Tesla.Env{status: 404, body: body}), do: {:error, "Pokemon not found"}
  defp handle_get({:error, _reason} = error), do: error
end
