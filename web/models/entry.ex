defmodule AhfiEx.Entry do
    use AhfiEx.Web, :model

    schema "journal_entry" do
      field :title, :string
      field :body, :string
      field :created, Ecto.DateTime
      #field :date_published, Ecto.Date  # edit form needs now..

      #timestamps
    end
    @required_fields ~w(title body created)
    @optional_fields ~w()

    def changeset(model, params \\ :empty) do
      model
      |> cast(params, @required_fields, @optional_fields)
    end

end
