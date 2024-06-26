defmodule GallowsWeb.HangmanHTML do
  use GallowsWeb, :html
 #alias GallowsWeb.CoreComponents, as: UI
  @responses %{
    :won => {:success,  "wygrana"},
    :lost => {:danger,  "oj koniec gry"},
    :good_guess => {:success, "dobra litera"},
    :bad_guess => {:warning, "zla liter"},
    :already_guessed => {:info, "bylo juz"},
    :initializing => {:info,  "start"},
  }

  def turn(left,target) when target>=left do
    "opacity: 1"
  end
  def turn(_left,_target)do
    "opacity: 0.1"
  end
  def game_state(assigns,_) when assigns not in  [:won,:lost]  do
    {kind, mes}= @responses[assigns]
    assigns=%{kind: kind,mes: mes}
    #raise(inspect(assigns))
    #UI.flash(%{:kind=>:info,:flash=>%{},:id=>2,:rest=>nil,:inner_block=> "tak"})
    #UI.greet(%{:name=>"konrad"})
    ~H"""
      <.flash kind={@kind} flash={%{}}>
        <%= @mes %>
      </.flash>
    """
  end

  def game_state(state=:lost,word) do
    {kind, mes}=@responses[state]
    assigns=%{kind: kind,mes: mes,word: word}
    ~H"""
      <.flash kind={@kind} flash={%{}} title="tak">
        <%= @mes %>
      </.flash>
    <strong> You lost...</strong>
    <p>the word was: <%=@word%></p>
    <.form for={} action="/hangman" method= "post" >
      <.button type="submit" class="button">
        Do you want play again?
      </.button>
    </.form>
    """
  end

  def game_state(state=:won,_) do
    assigns=@responses[state]
    ~H"""
    <strong> YOU WON</strong>
    <.form for={} action="/hangman" method= "post" >
      <.button type="submit" class="button">
        Do you play again?
      </.button>
    </.form>
    """
  end



  embed_templates "hangman_html/*"
end
