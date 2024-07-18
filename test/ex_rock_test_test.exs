defmodule ExRockTestTest do
  use ExUnit.Case

  setup do
    db_path = Path.join(System.tmp_dir!(), "test_db_#{UUID.uuid4()}")
    ExRock.destroy(db_path)

    on_exit(fn ->
      ExRock.destroy(db_path)
    end)

    %{db_path: db_path}
  end

  test "load db nif", context do
    {:ok, db} = ExRock.open(context.db_path)
    assert is_reference(db)
  end

  test "put/get", context do
    {:ok, db} = ExRock.open(context.db_path)
    :ok = ExRock.put(db, "key", "value")
    {:ok, "value"} = ExRock.get(db, "key")
  end
end
