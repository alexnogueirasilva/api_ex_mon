defmodule ExMon.Trainer.CreateTest do
  use ExMon.DataCase

  alias ExMon.{Repo, Trainer}
  alias Trainer.Create

  @moduletag :capture_log

  describe "call/1" do
    test "when all params are valid, creates a trainer" do
      params = %{
        name: "Ash Ketchum",
        password: "12345678",
      }

      count_before = Repo.aggregate(Trainer, :count)

      trainer = Create.call(params)

      count_after = Repo.aggregate(Trainer, :count)

      assert {:ok, %Trainer{
        name: "Ash Ketchum",
        password: "12345678",
      }} = trainer

      assert count_after > count_before
    end

    test "when all params are invalid, creates a trainer with erros" do
      params = %{
        name: "Ash Ketchum"
      }

      trainer = Create.call(params)

      assert {:error, changeset} = trainer

      assert errors_on(changeset) == %{password: ["can't be blank"]}

    end
  end
end
