defmodule ConversionUtils do
  def convert_to(s, :integer) do
    Integer.parse(s)
    |> elem(0)
  end
end

defmodule IOUtils do
  def parse_input_line(l) do
    String.trim(l)
    |> String.split(" ")
    |> Enum.map(&ConversionUtils.convert_to(&1, :integer))
  end
end

defmodule Progression do
  defp _progression(0, 0, 0), do: ""
  defp _progression(a, b, c) when (b - a) == (c - b), do: "AP #{c + (c - b)}"
  defp _progression(_, b, c), do: "GP #{div(c * c, b)}"

  defp _invoke_progression([a, b, c]), do: _progression(a, b, c)

  def find_next(l) do
    IOUtils.parse_input_line(l)
    |> _invoke_progression
  end
end

Enum.each Stream.map(IO.stream(:stdio, :line), &Progression.find_next(&1)), &IO.puts(&1)
