defmodule Hello do
  def print(lang \\ :en)
  def print(:en), do: "Hello world!!!"
  def print(:es), do: "Hola edmundo!!!"
  def print(:fr), do: "Bonjour !!!!"
  def print(:ch), do: "你好 !!!!"

  def fib(0), do: 0
  def fib(1), do: 1
  def fib(n), do: fib(n-2) + fib(n-1)

  def count(list), do: counting(list, 0)
  defp counting([], counter), do: counter
  defp counting([_|t], counter) do
    counting(t, counter + 1)
  end

  def piping(l) do
    l
    |> Enum.map(fn x -> x * 3 end)
    |> Enum.filter(fn x -> x > 15 end)
    |> Enum.filter(fn x -> rem(x,2) == 0 end)
    |> Enum.count
  end

end

IO.puts(Hello.print())
IO.puts(Hello.print(:es))
IO.puts(Hello.print(:ch))
IO.puts(Hello.fib(10))
