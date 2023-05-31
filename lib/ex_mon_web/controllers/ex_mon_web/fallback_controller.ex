defmodule ExMonWeb.FallbackController do
  @moduledoc false

  use ExMonWeb, :controller

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(ExMonWeb.ChangesetJSON)
    |> render(:bad, %{result: result})
  end

end
