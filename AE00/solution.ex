defmodule ConversionUtils do
  def convert_to(s, :integer) do
    Integer.parse(s)
    |> elem(0)
  end
end

defmodule RectangleCounter do
  defp generate_range(n), do: 1..n

  defp count_divisors(n, i) when i * i > n, do: 0
  defp count_divisors(n, i) when rem(n, i) == 0, do: 1 + count_divisors(n, i + 1)
  defp count_divisors(n, i), do: count_divisors(n, i + 1)

  def count(n) do
    ConversionUtils.convert_to(n, :integer)
    |> generate_range
    |> Enum.map(&count_divisors(&1, 1))
    |> Enum.sum
  end
end

Enum.each Stream.map(IO.stream(:stdio, :line), &RectangleCounter.count(&1)), &IO.puts(&1)
