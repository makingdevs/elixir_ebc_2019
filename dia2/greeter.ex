defmodule Greeter do

  def hello(names, language \\ "es")
  def hello(names, language) when is_list(names) do
    names
    |> Enum.join(", ")
    |> hello(language)
  end

  def hello(name, language) when is_binary(name) do
    phrase(language) <> " " <> name
  end

  def hello(%{lastname: lastname, name: name} = _person, language) do
    phrase(language) <> " #{name} #{lastname}"
  end

  def hello(%{name: name} = _person, language) do
    phrase(language) <> " #{name}"
  end

  defp phrase("es"), do: "Hola"
  defp phrase("en"), do: "Hello"

end
