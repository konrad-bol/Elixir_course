
shopping = [
  { "1 dozen", "eggs" },
  { "1 ripe", "melon" },
  { "4", "apples" },
  { "2 boxes", "tea" },
]
  tamplate= """
  quantity | item
  --------------------
    <%= for { qty, item } <- list do %>
    <%= String.pad_leading(qty, 8) %> | <%= item %>
    <% end %>
  """

  EEx.eval_string(tamplate,[list: shopping],trim: true)|>
  IO.puts()
