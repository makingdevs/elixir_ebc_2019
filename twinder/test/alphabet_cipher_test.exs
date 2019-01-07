defmodule Twinder.AlphabetCipher.Test do
  use ExUnit.Case

  test "encode a message" do
    message = "meetmebythetree"
    secret = "scone"
    result = AlphabetCipher.encode(message, secret)
    assert result == "egsgqwtahuiljgs"
  end

  test "decode a message" do
    secret_message = "egsgqwtahuiljgs"
    secret = "scone"
    result = AlphabetCipher.decode(secret_message, secret)
    assert result == "meetmebythetree"
  end
end
