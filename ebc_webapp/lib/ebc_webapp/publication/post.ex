defmodule EbcWebapp.Publication.Post do
  use Ecto.Schema
  import Ecto.Changeset


  schema "posts" do
    field :body, :string
    field :publication_date, :naive_datetime
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :publication_date, :body])
    |> validate_required([:title, :publication_date, :body])
  end
end
