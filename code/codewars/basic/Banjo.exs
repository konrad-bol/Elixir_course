defmodule TalantDetector do
  def are_you_playing_banjo?(name) do

    case name |> String.downcase() |> String.at(0) do
       "r"-> "#{name} plays banjo"
        _-> "#{name} does not play banjo"
    end
  end
end
