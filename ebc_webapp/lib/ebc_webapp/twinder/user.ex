defmodule EbcWebapp.Twinder.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias EbcWebapp.Publication.Post

  schema "users" do
    field :born_date, :date
    field :email, :string
    field :full_name, :string
    field :username, :string
    has_many :posts, Post

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :full_name, :email, :born_date])
    |> validate_format(:email, ~r/@/)
    |> validate_required([:username, :full_name, :email, :born_date])
  end
end
