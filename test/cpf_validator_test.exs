defmodule CpfValidatorTest do
  use ExUnit.Case
  doctest CpfValidator

  test "Test valid CPFs" do
    assert CpfValidator.Validator.validate("111.222.333/92") == true
    assert CpfValidator.Validator.validate("222.333.444/05") == true
    assert CpfValidator.Validator.validate("333.444.555/08") == true
    assert CpfValidator.Validator.validate("123.456.789/09") == true
    assert CpfValidator.Validator.validate("987.654.321/00") == true
  end

  test "Test invalid CPFs" do
    assert CpfValidator.Validator.validate("111.222.333/44") == false
    assert CpfValidator.Validator.validate("222.333.444/55") == false
    assert CpfValidator.Validator.validate("333.444.555/66") == false
    assert CpfValidator.Validator.validate("123.456.789/00") == false
    assert CpfValidator.Validator.validate("987.654.321/11") == false
  end

end
