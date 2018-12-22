defmodule Greeter do

  def hello(names) when is_list(names) do
    names
    |> Enum.join(", ")
    |> hello
  end

  def hello(name) when is_binary(name) do
    phrase() <> " " <> name
  end

  def hello(%{lastname: lastname, name: name} = _person) do
    phrase() <> " #{name} #{lastname}"
  end

  def hello(%{name: name} = _person) do
    phrase() <> " #{name}"
  end

  defp phrase(), do: "Hello"

end
