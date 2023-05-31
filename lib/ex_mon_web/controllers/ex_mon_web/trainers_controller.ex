defmodule ExMonWeb.TrainersController do
  @moduledoc false

  use ExMonWeb, :controller

  action_fallback ExMonWeb.FallbackController

  def create(conn, params) do
    params
    |> ExMon.create_trainer()
    |> handel_response(conn)
  end

  defp handel_response({:ok, trainer}, conn) do
    conn
    |> put_status(:created)
    |> render(:create, trainer: trainer)
  end

  defp handel_response({:error, _changeset} = error, _conn), do: error
end
