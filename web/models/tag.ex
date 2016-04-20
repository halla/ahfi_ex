defmodule AhfiEx.Tag do
    use AhfiEx.Web, :model

    @required_fields ~w(name slug)
    @optional_fields ~w()

    schema "taggit_tag" do
        field :name, :string
        field :slug, :string
    end

    def changeset(model, params \\ :empty ) do
        model
        |> cast(params, @required_fields, @optional_fields)
        |> validate_length(:name, min: 1)
    end
end
