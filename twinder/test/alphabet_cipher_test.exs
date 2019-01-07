defmodule Twinder.AlphabetCipher.Test do
  use ExUnit.Case

  test "Cipher a message" do
    message = "meetmebythetree"
    secret = "scone"
    result = AlphabetCipher.encode(message, secret)
    assert result == "egsgqwtahuiljgs"
  end
end
