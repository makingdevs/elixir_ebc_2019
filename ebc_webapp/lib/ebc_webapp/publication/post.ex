defmodule EbcWebapp.Publication.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias EbcWebapp.Twinder.User

  schema "posts" do
    field :body, :string
    field :publication_date, :naive_datetime
    field :title, :string
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :publication_date, :body, :user_id])
    |> validate_required([:title, :publication_date, :body, :user_id])
  end
end
