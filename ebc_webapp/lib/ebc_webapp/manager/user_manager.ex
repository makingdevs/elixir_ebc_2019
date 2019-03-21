defmodule EbcWebapp.Twinder.UserManager do

  def greet() do
    receive do
      :any ->
        IO.puts "Cualquiera"
        greet()
      {a, b} ->
        IO.puts "#{a} #{b}"
        greet()
      :exit ->
        :noop
    end
  end

  def parallel_map(list, fun) when is_list(list) do
    list
    |> Enum.map(fn e ->
      p = spawn(__MODULE__, :operate, [fun])
      send p, e
    end)
  end

  def operate(fun) do
    receive do
      a ->
        apply(fun, [a])
    end
  end

end
