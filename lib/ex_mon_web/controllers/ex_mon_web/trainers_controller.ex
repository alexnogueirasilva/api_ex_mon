defmodule ExMonWeb.TrainersController do
  @moduledoc false

  use ExMonWeb, :controller

  def create(conn, params) do
    params
    |> ExMon.create_trainer()
    |> handel_response(conn)
  end

  defp handel_response({:ok, trainers}, conn) do
    conn
    |> put_status(:ok)
    |> render(:create, trainers: trainers)
  end
end
