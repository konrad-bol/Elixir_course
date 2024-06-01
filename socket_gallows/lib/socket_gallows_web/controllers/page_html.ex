defmodule SocketGallowsWeb.PageHTML do
  use SocketGallowsWeb, :html

  def turn(value, threshold) do
    if value < threshold do
      "opacity: 0.1"
    else
      "opacity: 1"
    end
  end

  embed_templates "page_html/*"
end
