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

defmodule StepCounter do
  defp _steps(x, x) when x >= 0, do: 2 * x - rem(x, 2)
  defp _steps(x, y) when x >= 2 and y == x - 2, do: 2 * (x - 1) - rem(x, 2)
  defp _steps(_, _), do: "No Number"

  defp _invoke_steps([x, y]), do: _steps(x, y)

  def count(l) do
    IOUtils.parse_input_line(l)
    |> _invoke_steps
  end
end

IO.gets("")
Enum.each Stream.map(IO.stream(:stdio, :line), &StepCounter.count(&1)), &IO.puts(&1)
