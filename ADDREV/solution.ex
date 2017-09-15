defmodule ReverseAdder do
  defp _parse_input_line(l) do
    String.trim(l)
    |> String.split(" ")
  end

  defp _reverse(s) do
    String.reverse(s)
  end

  defp _convert_to(s, :integer) do
    Integer.parse(s)
    |> elem(0)
  end

  defp _convert_to(n, :string) do
    Integer.to_string(n)
  end

  def apply(l) do
    _parse_input_line(l)
    |> Enum.map(&_reverse(&1))
    |> Enum.map(&_convert_to(&1, :integer))
    |> Enum.reduce(&(&1 + &2))
    |> _convert_to(:string)
    |> _reverse
    |> _convert_to(:integer)
  end
end

IO.gets("")
Enum.each Stream.map(IO.stream(:stdio, :line), &ReverseAdder.apply(&1)), &IO.puts(&1)
