defmodule Ag do
  @moduledoc """
  Documentation for Ag.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Ag.hello()
      :world

  """
  def hello do
    :world
  end

  @doc """
  FizzBuzz.

  ## Examples

      iex> Ag.fizz_buzz()
      returns #'s 1-15:
        - for multiples of three print "Fizz"
        - for the multiples of five print "Buzz"
        - for multiples of both three and five print "FizzBuzz"

  """
  def fizz_buzz_1 do
    fizz_buzz = fn num ->
      cond do
        rem(num, 5) == 0 and rem(num, 3) == 0 ->
          IO.puts("FizzBuzz")

        rem(num, 3) == 0 ->
          IO.puts("Fizz")

        rem(num, 5) == 0 ->
          IO.puts("Buzz")

        true ->
          IO.puts(num)
      end
    end

    Enum.each(1..15, fizz_buzz)
  end

  def divisible_by_3?(n), do: rem(n, 3) == 0
  def divisible_by_5?(n), do: rem(n, 5) == 0

  def fizz_buzz_2 do
    fizz_buzz = fn num ->
      cond do
        Ag.divisible_by_3?(num) and Ag.divisible_by_5?(num) ->
          IO.puts("FizzBuzz")

        Ag.divisible_by_3?(num) ->
          IO.puts("Fizz")

        Ag.divisible_by_5?(num) ->
          IO.puts("Buzz")

        true ->
          IO.puts(num)
      end
    end

    Enum.each(1..15, fizz_buzz)
  end

  def fizz_buzz_3 do
    calculate = fn
      0, 0, _ -> "FizzBuzz"
      0, _, _ -> "Fizz"
      _, 0, _ -> "Buzz"
      _, _, n -> n
    end

    fizz_buzz = fn num ->
      IO.puts(calculate.(rem(num, 3), rem(num, 5), num))
    end

    Enum.each(1..15, fizz_buzz)
  end

  def fizz_buzz_4 do
    fizz_buzz = fn num ->
      case({rem(num, 3), rem(num, 5)}) do
        {0, 0} -> IO.puts("FizzBuzz")
        {0, _} -> IO.puts("Fizz")
        {_, 0} -> IO.puts("Buzz")
        _ -> IO.puts(num)
      end
    end

    Enum.each(1..15, fizz_buzz)
  end
end
