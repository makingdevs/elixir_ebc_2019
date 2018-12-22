defmodule Greeter do

  def hello(%{name: name} = person) do
    IO.puts "Hello #{name}"
    IO.inspect person
  end

end
