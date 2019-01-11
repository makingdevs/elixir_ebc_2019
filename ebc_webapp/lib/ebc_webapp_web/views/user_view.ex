defmodule EbcWebappWeb.UserView do
  use EbcWebappWeb, :view

  def current_date() do
    today =  Date.utc_today
    "#{today.day} - #{today.month} - #{today.year}"
  end

  def count_users(users) do
    """
    There are #{Enum.count(users)} users.
    """
  end

end
