defmodule ExMonWeb.PokemonsController do
  @moduledoc false

  use ExMonWeb, :controller

  action_fallback ExMonWeb.FallbackController

  def show(conn, %{"name" => name}) do
    name
    |> ExMon.fetch_pokemon()
    |> handel_response(conn)
  end

  defp handel_response({:ok, pokemon}, conn) do
    conn
    |> put_status(:ok)
    |> json(pokemon)
  end

  defp handel_response({:error, _reason} = error, _conn), do: error
end
