defmodule Ecto.InstaShard.Sharding.Hashing do
  use Bitwise, only_operators: true

  @doc """
  Get a hash for an item id
  """
  def item_hash(id) do
    :erlang.phash2(id)
  end

  @doc """
  Get the shard number from an item id.

  Useful when it's necessary to select the item from the database or insert
  related data.
  """
  def extract(item_id) when is_integer(item_id) do
    ((item_id ^^^ ((item_id >>> 23) <<< 23 )) >>> 10)
  end

  @doc """
  Get the shard number for a given item id
  """
  def get_shard_for_id(id, amount_shards) do
    rem(id, amount_shards)
  end
end
