# Logica:
#
#  Numeros de 1 a 100.
#
#  Para pares, trocar numero por "Go"
#  Para primos, trocar numero por "Nama"
#  Para pares e primos, trocar numero por "Go Nama"
require 'prime'

# Classe que vai carregar o teste
class NamaTest
  # Nesse exemplo vou usar [0..100] sempre
  # mas coloquei para receber essa informacao :)
  attr_accessor :array_of_numbers

  def filter_rest
    unless @array_of_numbers.is_a?(Array)
      raise ArgumentError, 'Os números precisam estar em um array', caller
    end

    @array_of_numbers.each_with_index do |actual_number, key|
      actual_number_is_prime = Prime.prime?(actual_number)

      if actual_number.even? && actual_number_is_prime
        @array_of_numbers[key] = 'Go Nama'
      elsif actual_number.even?
        @array_of_numbers[key] = 'Go'
      elsif actual_number_is_prime
        @array_of_numbers[key] = 'Nama'
      end
    end # each of @array_of_numbers
  end # def filter_rest

  def print_final_result
    filter_rest
    @array_of_numbers.join(', ')
  end # def print_final_result
end # NamaTest Class

# Carrega a classe
result_of_the_test = NamaTest.new

# Define os numeros a serem tratados pelo filtro
result_of_the_test.array_of_numbers = Array(1..100)

# Cospe o resultado
puts result_of_the_test.print_final_result

# Adiciona uma linha final
puts "\n"
