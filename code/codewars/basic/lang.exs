defmodule Greeter do
  def greet(language) do
    data=%{
   "english"=> "Welcome",
   "czech" =>"Vitejte",
   "danish"=> "Velkomst",
   "dutch"=> "Welkom",
   "estonian"=> "Tere tulemast",
   "finnish"=> "Tervetuloa",
   "flemish"=> "Welgekomen",
   "french"=> "Bienvenue",
   "german"=> "Willkommen",
   "irish"=> "Failte",
   "italian"=> "Benvenuto",
   "latvian"=>"Gaidits",
   "lithuanian"=> "Laukiamas",
   "polish"=>"Witamy",
   "spanish"=> "Bienvenido",
   "swedish"=>"Valkommen",
   "welsh"=>"Croeso"
  }

    case Map.get(data,language) do
       nil -> "Welcome"
       _ ->  Map.get(data,language)
    end
  end
end
