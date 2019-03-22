defmodule EbcWebapp.Twinder.PingPong do

  def init() do
    ping = spawn(__MODULE__, :ping, [])
    pong = spawn(__MODULE__, :pong, [])
    send pong, {:ping, ping}
    {ping, pong}
  end

  def ping() do
    receive do
      {:pong, sender} ->
        IO.puts "PONG"
        :timer.sleep(2000)
        send sender, {:ping, self}
        ping()
      :exit ->
        "Ping ended"
    end
  end

  def pong() do
    receive do
      {:ping, sender} ->
        IO.puts "PING"
        :timer.sleep(2000)
        send sender, {:pong, self}
        pong()
      :exit ->
        "Pong ended"
    end
  end

  def ping_pong do
    receive do
      {:ping, sender} ->
        IO.puts "PING"
        :timer.sleep(2000)
        send sender, {:pong, self}
        ping_pong()
      {:pong, sender} ->
        IO.puts "PONG"
        :timer.sleep(2000)
        send sender, {:ping, self}
        ping_pong()
      :exit ->
        "Ping Pong ended"
    end
  end

end
