defmodule ConversionUtils do
  def convert_to(s, :string) do
    Integer.parse(s)
    |> elem(0)
  end
end

defmodule IOUtils do
  def parse_input_line(l) do
    String.trim(l)
    |> String.split(" ")
    |> Enum.map(&ConversionUtils.convert_to(&1, :string))
  end
end

defmodule ListUtils do
  def print_elements(l) do
    Enum.each l, &IO.puts(&1)
    IO.puts ''
  end
end

defmodule PrimeFinder do
  defp _is_divided_by?(i, n) when i * i > n, do: false
  defp _is_divided_by?(i, n) when rem(n, i) == 0, do: true
  defp _is_divided_by?(2, n), do: _is_divided_by? 3, n
  defp _is_divided_by?(3, n), do: _is_divided_by? 5, n
  defp _is_divided_by?(i, n) when rem(i, 6) == 1, do: _is_divided_by? i + 4, n
  defp _is_divided_by?(i, n) when rem(i, 6) == 5, do: _is_divided_by? i + 2, n

  defp _has_divisors?(n) do
    _is_divided_by? 2, n
  end

  def find(l) do
    [m, n] = IOUtils.parse_input_line l
    for i <- m..n do
      if i == 2 or i == 3 or (i > 1 and rem(i, 6) in [1, 5] and not _has_divisors?(i)) do
        IO.puts i
      end
    end
    IO.puts ''
  end
end

IO.gets ''
Enum.each IO.stream(:stdio, :line), &PrimeFinder.find(&1)
