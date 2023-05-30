defmodule ExMonWeb.WelcomeController do
  @moduledoc false

  use ExMonWeb, :controller

  def index(conn, _params) do
    text(conn, "Welcome to ExMon!")
  end
end
