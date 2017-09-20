defmodule ConversionUtils do
  def convert_to(s, :integer) do
    Integer.parse(s)
    |> elem(0)
  end
end

defmodule IOUtils do
  def read_integer() do
    IO.gets("")
    |> ConversionUtils.convert_to(:integer)
  end

  def read_list_of_integers(n) do
    Enum.take(IO.stream(:stdio, :line), n)
    |> Enum.map(&ConversionUtils.convert_to(&1, :integer))
  end
end

defmodule IntegerUtils do
  def truncate_when_integer(n) when trunc(n) == n, do: trunc(n)
  def truncate_when_integer(_), do: -1
end

defmodule Statistics do
  def mean(l), do: Enum.sum(l) / length(l)

  def deviation(m, l) do
    Enum.reduce(l, 0, &(&2 + abs(m - &1))) / 2
  end
end

defmodule CandyMoveCounter do
  def count(l) do
    Statistics.mean(l)
    |> Statistics.deviation(l)
    |> IntegerUtils.truncate_when_integer
  end
end

defmodule CandyMoveReader do
  defp _process_input_block(-1), do: IO.puts("")

  defp _process_input_block(n) do
    IOUtils.read_list_of_integers(n)
    |> CandyMoveCounter.count
    |> IO.puts
    run()
  end

  def run() do
    IOUtils.read_integer()
    |> _process_input_block
  end
end

CandyMoveReader.run()
