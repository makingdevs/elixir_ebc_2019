result = if String.valid?("Hello") do
  "Valid"
else
  "Invalid"
end

IO.puts result

tuple = {:ok, 512.32}

result = case tuple do
  {:ok, result} -> result
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
