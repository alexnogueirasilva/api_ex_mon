defmodule ExMonWeb.ChangesetJSON do
  @moduledoc false
  import Ecto.Changeset, only: [traverse_errors: 2]

  def render("bad.json", %{result: %Ecto.Changeset{} = result}) do
    %{message: translate_erros(result)}
  end

  def render("bad.json", %{result: message}) do
    %{message: message}
  end

  defp translate_erros(changeset) do
    traverse_errors(changeset, fn {msg, opts} ->
      Enum.reduce(opts, msg, fn {key, value}, acc ->
        String.replace(acc, "%{#{key}}", to_string(value))
      end)
    end)
  end

end
