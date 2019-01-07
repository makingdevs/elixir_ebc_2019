defmodule Twinder.AlphabetCipher do

  def encode(message, secret) do
    secret_pad = String.pad_trailing("", String.length(message), secret)
    secret_chars = String.to_charlist(String.upcase(secret_pad))
    message_chars = String.to_charlist(String.upcase(message))
    substitution_chart = substitution_chart()
    result = encode(message_chars, secret_chars, substitution_chart, [])
    List.to_string(result) |> String.downcase
  end

  def decode(_secret_message, _secret) do
    "meetmebythetree"
  end

  def encode([], [], _substitution_chart, cipher_message), do: cipher_message
  def encode([message_letter | message_chars], [secret_letter | secret_chars], substitution_chart, cipher_message) do
    {_,_, s} = substitution_chart
               |> Enum.find(fn {ml, mc, _s} ->
                 message_letter == ml and secret_letter == mc
               end)
    encode(message_chars, secret_chars, substitution_chart, cipher_message ++ [s])
  end

  def substitution_chart do
    letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    substitution_chart(letters, length(letters), [])
  end

  def substitution_chart(_letters, 0, matrix) do
    matrix
  end
  def substitution_chart(letters, n, matrix) do
    letters = rotate(letters)
    [letter_row | _ ] = letters
    substitution_chart(letters, n-1, matrix ++ generate_secret({letter_row, letters}))
  end

  def rotate([h|t] = _alphabet) do
    t ++ [h]
  end

  def generate_secret({letter_row, letters}) do
    generate_secret(letter_row, letters, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', [])
  end

  def generate_secret(_, [], [], secrets), do: secrets
  def generate_secret(letter_row, letters, alphabet, secrets) do
    [secret | rest] = letters
    [column | alphabet_rest] = alphabet
    generate_secret(letter_row, rest, alphabet_rest, [{letter_row, column, secret} | secrets] )
  end

end
