result = if String.valid?("Hello") do
  "Valid"
else
  "Invalid"
end

IO.puts result

tuple = {:ok, 512.32}
tuple2 = {:ok, "hello"}

result = case tuple2 do
  {:ok, result} when is_float(result) -> result * 2
  {:ok, result} when is_binary(result) -> result
  {:error, reason} -> "ERRORZ: #{reason}"
  _ -> "Catch all"
end

IO.puts result

file = File.read(System.get_env("HOME") <> "/.gitconfig")

result = case file do
  {:ok, text} -> String.length(text)
  {:error, reason} -> "Can't read because #{reason}"
  _ -> "Unreachable case"
end

IO.puts result

case :even do
  :odd -> "Odd"
  _ -> "even"
end
