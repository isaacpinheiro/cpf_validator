defmodule CpfValidator.Validator do

  def validate(cpf) do

    [formated_numbers, conf_digits] = cpf |> String.split("/")
    [n1, n2, n3] = formated_numbers |> String.split(".")
    numbers = n1 <> n2 <> n3

    numbers_list = generate_numbers_list(String.to_char_list(numbers), [])
    first_conf_digit = fix_numbers(generate_conf_digit(numbers_list, 10, 0))
    second_conf_digit = fix_numbers(generate_conf_digit(numbers_list, 11, 0))

    generated_conf_digits = Integer.to_string(first_conf_digit) <> Integer.to_string(second_conf_digit)
    res = valid?(generated_conf_digits, conf_digits)
    res

  end

  defp generate_numbers_list([h | t], numbers_list) do
    generate_numbers_list(t, numbers_list ++ [String.to_integer(<<h>>)])
  end

  defp generate_numbers_list([], numbers_list) do
    numbers_list
  end

  defp generate_conf_digit([h | t], n, acc) do
    generate_conf_digit(t, n-1, acc + (h*n))
  end

  defp generate_conf_digit([], _, acc) do
    11 - (rem(acc, 11)) 
  end

  defp fix_numbers(n) when n >= 10 do
    0
  end

  defp fix_numbers(n) do
    n
  end

  defp valid?(n, m) do
    n == m
  end

end
