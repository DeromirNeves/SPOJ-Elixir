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

defmodule Factorial do
  defp _factorial(0), do: 1
  defp _factorial(1), do: 1

  defp _factorial(n) do
    n * _factorial(n - 1)
  end

  def calculate(l) do
    IOUtils.parse_input_line(l)
    |> _factorial
  end
end

IO.gets("")
Enum.each Stream.map(IO.stream(:stdio, :line), &Factorial.calculate(&1)), &IO.puts(&1)
