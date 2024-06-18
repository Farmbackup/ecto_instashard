defmodule Ecto.InstaShard.Sharding.Hashing do
  @doc """
  Get the shard number for a given item id
  """
  def get_shard_for_id(id, amount_shards) do
    rem(id, amount_shards)
  end
end
