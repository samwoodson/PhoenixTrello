defmodule PhoenixTrello.List do
  use PhoenixTrello.Web, :model

  alias PhoenixTrello.{Board, List}

  @derive {Poison.Encoder, only: [:id, :board_id, :name, :cards]}

  schema "lists" do
    field :name, :string
    belongs_to :board, PhoenixTrello.Board
    has_many :cards, Card

    timestamps
  end

  @required_fields ~w(name)
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
