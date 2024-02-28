defmodule Dictionary.Wordlist do
  @me __MODULE__
  def start_link() do
    Agent.start_link(&word_list/0, name: @me)
  end
  def random_word() do
   # if true do
    #  Agent.get(@me,fn _ -> exit(:boom) end )
    #end
    Agent.get(@me ,&Enum.random(&1))

  end
  def word_list() do
    "/Users/kodi/Desktop/Elixir/game/dictionary/assets/words.txt"
    |> Path.expand(__DIR__)
    |> File.read!()
    |> String.split(~r/\n/)
  end


end
