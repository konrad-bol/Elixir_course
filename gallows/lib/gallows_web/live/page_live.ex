defmodule GallowsWeb.PageLive do
  use GallowsWeb, :live_view

  def mount(_parms,_sesion,socket) do
    {:ok,assign(socket, number: 0,form: Phoenix.HTML.FormData.to_form(%{"add_amount"=> 3},as: "form"))}
  end

  def handele_event("add",_parms,socket) do
    {:noreply, assign(socket, number: socket.assigns.number +1)}
  end

def render(assigns) do
  ~H"""
  hello h
  """
end


end
