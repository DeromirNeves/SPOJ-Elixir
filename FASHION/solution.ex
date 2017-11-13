defmodule IOUtils do
  defp _convert_to(s, :integer) do
    Integer.parse(s)
    |> elem(0)
  end

  def parse_input_line(l) do
    String.trim(l)
    |> String.split(" ")
    |> Enum.map(&_convert_to(&1, :integer))
  end
end

defmodule MMDSMath do
  defp _mutiply(x, acc, b) do
    {x * Enum.at(b, acc), acc + 1}
  end

  def calculate_mmds(a, b) do
    Enum.map_reduce(a, 0, &_mutiply(&1, &2, b))
    |> elem(0)
    |> Enum.sum
  end
end

defmodule Hotness do
  
  defp _sort_hotness(list) do
    list
    |> Enum.sort
  end

 def calculate(chunk) do
    men = Enum.at(chunk, 1)
    women = Enum.at(chunk, 2)
    MMDSMath.calculate_mmds(_sort_hotness(men), _sort_hotness(women))
    |> IO.puts
 end

end

IO.gets("")

Enum.chunk(Stream.map(IO.stream(:stdio, :line), &IOUtils.parse_input_line(&1)), 3)
|> Enum.map(&Hotness.calculate(&1))

