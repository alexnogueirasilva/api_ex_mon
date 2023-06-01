defmodule ExMonWeb.TrainersController do
  @moduledoc false

  use ExMonWeb, :controller

  action_fallback ExMonWeb.FallbackController

  def create(conn, params) do
    params
    |> ExMon.create_trainer()
    |> handel_response(conn, :create, :created)
  end

  def delete(conn, %{"id" => id}) do
    id
    |> ExMon.delete_trainer()
    |> handel_delete(conn)
  end

  def show(conn, %{"id" => id}) do
    id
    |> ExMon.fetch_trainer()
    |> handel_response(conn, :show, :ok)
  end

  def update(conn, params) do
    params
    |> ExMon.update_trainer()
    |> handel_response(conn, :update, :ok)
  end

  defp handel_response({:ok, trainer}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, trainer: trainer)
  end

  defp handel_delete({:ok, _trainer}, conn) do
    conn
    |> put_status(:no_content)
    |> text("")
  end


  defp handel_response({:error, _changeset} = error, _conn, _view, _status), do: error
  defp handel_delete({:error, _reason} = error, _conn), do: error
end
