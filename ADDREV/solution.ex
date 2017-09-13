defmodule ReverseAdder do
  defp parse(l) do
    String.trim(l)
    |> String.split(" ")
  end

  defp reverse(s) do
    String.reverse(s)
  end

  defp string_to_int(s) do
    Integer.parse(s)
    |> elem(0)
  end

  defp int_to_string(n) do
    Integer.to_string(n)
  end

  def apply(l) do
    parse(l)
    |> Enum.map(&reverse(&1))
    |> Enum.map(&string_to_int(&1))
    |> Enum.reduce(&(&1 + &2))
    |> int_to_string
    |> reverse
    |> string_to_int
  end
end

IO.gets("")
Enum.each Stream.map(IO.stream(:stdio, :line), &ReverseAdder.apply(&1)), &IO.puts(&1)
