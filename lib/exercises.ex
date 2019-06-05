defmodule Exercises do
  @moduledoc """
  Documentation for Exercises.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Exercises.hello()
      :world

  """
  def hello do
    :world
  end

  def my_if(condition) do
    if condition do
      {:ok, "es Correcto"}
    else
      {:error, "es Incorrecto"}
    end
  end

  def my_cond(condition) do
    cond do
      condition > 5 -> "es mayor que cinco"
      condition < 5 -> "es menor a cinco"
      true -> "ninguna de las anteriores"
    end
  end

  def my_case(condition) do
    case condition do
      {:ok, result} when is_number(result) -> result
      {:error} -> "Es un Error"
    end
  end

  def area({:rectangle, w, h}) do
    w * h
  end

  def area({:circle, r}) when is_number(r) do
    3.14 * r * r
  end

  def sum_list([head | tail], acc) do
    IO.puts(acc + head)
    sum_list(tail, acc + head)
  end

  def sum_list([], acc) do
    acc
  end

  def area_loop do
    receive do
      {:rectangle, w, h} ->
        IO.puts("Area = #{w * h}")
        area_loop()

      {:circle, r} ->
        IO.puts("Area = #{3.14 * r * r}")
        area_loop()
    end
  end

  pid = spawn(fn -> Exercises.area_loop() end)
  pid = spawn(Exercises, :area_loop, [])
  send(pid, {:rectangle, 2, 3})
  send(pid, {:circle, 2})
end
