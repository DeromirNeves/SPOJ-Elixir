defmodule ConversionUtils do
  def convert_to(s, :integer) do
    Integer.parse(s)
    |> elem(0)
  end
end

defmodule TrailingZeroes do
  defp _parse_input_line(l) do
    String.trim(l)
    |> ConversionUtils.convert_to(:integer)
  end

  defp _legendre(n) when n <= 1, do: 0

  defp _legendre(n) do
    q = n / 5
    trunc(q) + _legendre(q)
  end

  def count(l) do
    _parse_input_line(l)
    |> _legendre
  end
end

IO.gets("")
Enum.each Stream.map(IO.stream(:stdio, :line), &TrailingZeroes.count(&1)), &IO.puts(&1)
