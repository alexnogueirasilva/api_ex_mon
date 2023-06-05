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

      assert count_before > count_after
    end
  end
end
