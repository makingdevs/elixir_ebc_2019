defmodule Twinder.AlphabetCipher do
  import String, only: [pad_trailing: 3, downcase: 1, upcase: 1]

  @alphabet 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'

  def encode(message, secret) do
    secret_chars =
      pad_trailing("", String.length(message), secret)
      |> upcase
      |> to_charlist
    message_chars = message |> upcase |> to_charlist

    encode(message_chars, secret_chars, substitution_chart(), [])
    |> List.to_string
    |> downcase
  end

  def decode(secret_message, secret) do
    secret_chars =
      pad_trailing("", String.length(secret_message), secret)
      |> upcase
      |> to_charlist
    message_chars = secret_message |> upcase |> to_charlist

    decode(message_chars, secret_chars, substitution_chart(), [])
    |> List.to_string
    |> downcase
  end

  def encode([], [], _substitution_chart, cipher_message), do: cipher_message
  def encode([message_letter | message_chars], [secret_letter | secret_chars], substitution_chart, cipher_message) do
    [s] = for {ml, mc, s} <- substitution_chart,
      message_letter == ml, secret_letter == mc, do: s
    encode(message_chars, secret_chars, substitution_chart, cipher_message ++ [s])
  end

  def decode([], [], _substitution_chart, decipher_message), do: decipher_message
  def decode([message_letter | message_chars], [secret_letter | secret_chars], substitution_chart, decipher_message) do
    {s, _, _} = substitution_chart
               |> Enum.find(fn {_ml, mc, s} ->
                 message_letter == s and secret_letter == mc
               end)
    decode(message_chars, secret_chars, substitution_chart, decipher_message ++ [s])
  end

  def substitution_chart do
    letters = @alphabet
    substitution_chart(letters, length(letters), [])
  end

  def substitution_chart(_letters, 0, matrix), do: matrix
  def substitution_chart(letters, n, matrix) do
    letters = rotate(letters)
    [letter_row | _ ] = letters
    substitution_chart(letters, n-1, matrix ++ generate_secret({letter_row, letters}))
  end

  @doc """
  Rotates a charlist one char.

  ## Examples

      iex> Twinder.AlphabetCipher.rotate('abcde')
      'bcdea'

  """
  def rotate([h|t] = _alphabet) do
    t ++ [h]
  end

  def generate_secret({letter_row, letters}) do
    generate_secret(letter_row, letters, @alphabet, [])
  end

  def generate_secret(_, [], [], secrets), do: secrets
  def generate_secret(letter_row, letters, alphabet, secrets) do
    [secret | rest] = letters
    [column | alphabet_rest] = alphabet
    generate_secret(letter_row, rest, alphabet_rest, [{letter_row, column, secret} | secrets] )
  end

end
