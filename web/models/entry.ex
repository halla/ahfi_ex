defmodule AhfiEx.Entry do
    use AhfiEx.Web, :model

    schema "journal_entry" do
      field :title, :string
      field :body, :string
      field :created, Ecto.DateTime
      has_many :tags, AhfiEx.TaggedItem, foreign_key: :object_id            
    end

    @required_fields ~w(title body created)
    @optional_fields ~w()

    def changeset(model, params \\ :empty) do
      model
      |> cast(params, @required_fields, @optional_fields)
      |> validate_length(:title, min: 1)
      |> validate_length(:body, min: 1)
    end

end
