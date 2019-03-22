defmodule EbcWebapp.Twinder.UserManager do
  use GenServer

  # API client
  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__,opts,  [name: __MODULE__])
  end

  def add_user(user) do
    GenServer.cast(__MODULE__, {:add, user})
  end

  def list_users() do
    GenServer.call(__MODULE__, :get)
  end

  # Server functions

  def init([]) do
    {:ok, ["ebc"]}
  end

  def handle_call(:get, _from, estado) do
    {:reply, estado, estado}
  end

  def handle_cast({:add, user}, estado) do
    {:noreply, [user | estado]}
  end

  def handle_info(:work, estado) do
    {:noreply, state}
  end

end
