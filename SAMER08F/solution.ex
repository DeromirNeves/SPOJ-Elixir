defmodule ConversionUtils do
  def convert_to(s, :integer) do
    Integer.parse(s)
    |> elem(0)
  end
end

defmodule IOUtils do
  def parse_input_line(l) do
    String.trim(l)
    |> ConversionUtils.convert_to(:integer)
  end
end

defmodule SquareCounter do
  defp _squares(0), do: ""
  defp _squares(n), do: div(n * (n + 1) * (2 * n + 1), 6)

  def count(l) do
    IOUtils.parse_input_line(l)
    |> _squares
  end
end

Enum.each Stream.map(IO.stream(:stdio, :line), &SquareCounter.count(&1)), &IO.puts(&1)
