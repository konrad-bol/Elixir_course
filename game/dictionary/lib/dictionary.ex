defmodule Dictionary do

  alias Dictionary.Wordlist

  defdelegate random_word(), to: Wordlist

end
