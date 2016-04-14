defmodule AhfiEx.TaggedItem do
    use AhfiEx.Web, :model

    schema "taggit_taggeditem" do
        #field :tag_id, :integer
        field :object_id, :integer
        belongs_to :tag, AhfiEx.Tag
    end
end
