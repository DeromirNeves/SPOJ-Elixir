defmodule InputPrinter do
  def print(n) when n == "42\n" or n == :eof do
  end

  def print(n) do
    IO.write(n)
    print(IO.gets(""))
  end
end

InputPrinter.print(IO.gets(""))
