defmodule AhfiEx.Tag do
    use AhfiEx.Web, :model

    schema "taggit_tag" do
        field :name, :string        
    end
end
