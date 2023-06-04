defmodule ExMon.TrainerTest do
  use ExMon.DataCase

  alias ExMon.Trainer

  @moduletag :capture_log

  describe "changeset/1" do
    test "when all are valid, returns a changeset with no errors" do
      params = %{
        name: "Ash Ketchum",
        password: "12345678",
      }

      changeset = Trainer.changeset(params)

      assert %Ecto.Changeset{
               changes: %{name: "Ash Ketchum",
                 password: "12345678",
               },
               errors: [],
               data: %ExMon.Trainer{},
               valid?: true
             }  = changeset
    end

    test "when all are invalid, returns a changeset with errors" do
      params = %{
        password: "12345678",
      }

      changeset = Trainer.changeset(params)

      assert %Ecto.Changeset{
               changes: %{
                 password: "12345678",
               },
               data: %ExMon.Trainer{},
               valid?: false
             }  = changeset

      assert errors_on(changeset) == %{name: ["can't be blank"]}
    end
  end

  describe "build/1" do
    test "when all params are valid, returns a trainer" do
      params = %{
        name: "Ash Ketchum",
        password: "12345678",
      }

      trainer = Trainer.build(params)

      assert {:ok, %Trainer{
        name: "Ash Ketchum",
        password: "12345678",
      }} = trainer
    end

    test "when all params are invalid, returns a trainer with erros" do
      params = %{
        password: "12345678",
      }

      {:error, trainer} = Trainer.build(params)

      assert %Ecto.Changeset{valid?: false} = trainer
      assert errors_on(trainer) == %{name: ["can't be blank"]}
    end
  end
end
