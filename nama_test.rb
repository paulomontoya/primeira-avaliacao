=begin

  # Lógica:

    Números de 1 a 100.

    Para pares, trocar número por "Go"
    Para primos, trocar número por "Nama"
    Para pares e primos, trocar número por "Go Nama"

=end
  
  require 'prime'

  class NamaTest

    attr_accessor :array_of_numbers # Nesse exemplo vou usar [0..100] sempre mas coloquei para receber essa informação :)

    def filter_rest
      unless @array_of_numbers.is_a?(Array)
        raise ArgumentError, "Os números precisam estar em um array", caller
      end

      @array_of_numbers.each_with_index do |actual_number, key|

        actual_number_is_prime = Prime.prime?(actual_number)

        if actual_number % 2 == 0 && actual_number_is_prime
          @array_of_numbers[key] = "Go Nama"
        elsif actual_number % 2 == 0
          @array_of_numbers[key] = "Go"
        elsif actual_number_is_prime
          @array_of_numbers[key] = "Nama"
        end

      end # each of @array_of_numbers

    end # def filter_rest


    def print_final_result
      self.filter_rest
      return @array_of_numbers.join(", ")
    end # def print_final_result

  end # NamaTest Class

  result_of_the_test = NamaTest.new
  result_of_the_test.array_of_numbers = Array(1..100) # Define os números a serem tratados pelo filtro
  puts result_of_the_test.print_final_result # Cospe o resultado
  puts "\n"
