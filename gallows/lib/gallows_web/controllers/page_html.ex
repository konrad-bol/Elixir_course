defmodule GallowsWeb.PageHTML do
  use GallowsWeb, :html
  def plural_of(word,1), do: word
  def plural_of(word,_), do: word <>"s"

  embed_templates "page_html/*"
end
