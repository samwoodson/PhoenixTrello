defmodule PhoenixTrello.Card do
  use PhoenixTrello.Web, :model

  @derive {Poison.Encoder, only: [:id, :list_id, :name]}

  schema "cards" do
    field :name, :string
    belongs_to :list, PhoenixTrello.List

    timestamps
  end

  @required_fields ~w(name list_id)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
