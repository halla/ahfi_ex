defmodule AhfiEx.Post do
  use AhfiEx.Web, :model

  schema "posts" do
    field :title, :string
    field :body, :string
    field :slug, :string
    field :date_published, Timex.Ecto.DateTime # show needs
    #field :date_published, Ecto.DateTime  # edit form needs now..

    #timestamps
  end

  @required_fields ~w(title body slug date_published)
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
