defmodule Twinder.AlphabetCipher.Test do
  use ExUnit.Case
  doctest Twinder.AlphabetCipher

  alias Twinder.AlphabetCipher

  test "encode a message" do
    message = "meetmebythetree"
    secret = "scones"
    result = AlphabetCipher.encode(message, secret)
    assert result == "egsgqwtahuiljgs"
  end

  test "decode a message" do
    secret_message = "egsgqwtahuiljgs"
    secret = "scones"
    result = AlphabetCipher.decode(secret_message, secret)
    assert result == "meetmebythetree"
  end
end
