defmodule AhfiEx.TagView do
    use AhfiEx.Web, :view

    def render("list.json", %{data: data}) do
        %{data: render_many(data, AhfiEx.TagView, "tag.json")}
    end

    def render("tag.json", %{tag: tag}) do
        %{id: tag.id, name: tag.name}
    end
end
