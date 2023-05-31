defmodule ExMonWeb.TrainersController do
  @moduledoc false

  use ExMonWeb, :controller

  action_fallback ExMonWeb.FallbackController

  def create(conn, params) do
    params
    |> ExMon.create_trainer()
    |> handel_response(conn)
  end

  def delete(conn, %{"id" => id}) do
    id
    |> ExMon.delete_trainer()
    |> handel_delete(conn)
  end

  defp handel_response({:ok, trainer}, conn) do
    conn
    |> put_status(:created)
    |> render(:create, trainer: trainer)
  end

  defp handel_delete({:ok, _trainer}, conn) do
    conn
    |> put_status(:no_content)
    |> text("")
  end

  defp handel_response({:error, _changeset} = error, _conn), do: error
  defp handel_delete({:error, _reason} = error, _conn), do: error
end
