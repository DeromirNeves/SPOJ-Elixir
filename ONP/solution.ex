defmodule IOUtils do
  def parse_input_line(l) do
    String.trim(l)
    |> String.graphemes
  end
end

defmodule RPN do
  defp _classify_token(c) do
    cond do
      c in ["+", "-", "*", "/", "^"] -> :operator
      c == "(" -> :left_bracket
      c == ")" -> :right_bracket
      true -> :operand
    end
  end

  defp _priority(o), do: %{"+" => 1, "-" => 2, "*" => 3, "/" => 4, "^" => 5}[o]

  defp _left_associative?(o), do: not o in ["^", "("]

  defp _pop_greater_precedence([], o), do: [o]

  defp _pop_greater_precedence([h | t], o) do
    if _priority(h) >= _priority(o) and _left_associative?(h) do
      IO.write h
      _pop_greater_precedence t, o
    else
      [o | [h | t]]
    end
  end

  defp _pop_until_left_bracket(["(" | t]), do: t
  defp _pop_until_left_bracket([h | t]), do: IO.write(h) && _pop_until_left_bracket(t)

  defp _process_token(:operand, s, o), do: IO.write(o) && s
  defp _process_token(:operator, s, o), do: _pop_greater_precedence s, o
  defp _process_token(:left_bracket, s, o), do: [o | s]
  defp _process_token(:right_bracket, s, _), do: _pop_until_left_bracket s

  defp _shunting_yard([], []), do: ""
  defp _shunting_yard([], [h | t]), do: IO.write(h) && _shunting_yard([], t)

  defp _shunting_yard([h | t], s) do
    _classify_token(h)
    |> _process_token(s, h)
    |> (&_shunting_yard(t, &1)).()
  end

  def transform(l) do
    IOUtils.parse_input_line(l)
    |> _shunting_yard([])
  end
end

IO.gets("")
Enum.each Stream.map(IO.stream(:stdio, :line), &RPN.transform(&1)), &IO.puts(&1)
