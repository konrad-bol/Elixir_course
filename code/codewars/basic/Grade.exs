defmodule GetGrade do
  def get_grade(a, b, c) do
    grade=(a+b+c)/3
    %{91.0=> "A", 80=>"B", 70=>"C", 60=>"D", 0=>"F"}
    |> Enum.reverse()
    |> Enum.find( fn {key,y}-> grade>key end)
    |> elem(1)

  end
end
