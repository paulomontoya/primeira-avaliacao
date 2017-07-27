=begin

  # Registro dos horários:

    Início: 18:08
    Milestone 1 -> Fazer o código exportar a string correta: 19:17 (1, 2, 3 ,4, Nama..)
    Fim: 21:18


  # Lógica:

    Números de 1 a 100.

    Para múltiplos de 35, trocar o número por "Nama Team" 
    Para múltiplos de 7, trocar o número por "Team" 
    Para múltiplos de 5, trocar o número por "Nama" 

=end

  class NamaTest

    attr_accessor :array_of_numbers # Nesse exemplo vou usar [0..100] sempre mas coloquei para receber essa informação :)

    def filter_rest
      unless @array_of_numbers.is_a?(Array)
        raise ArgumentError, "Os números precisam estar em um array", caller
      end

      @array_of_numbers.each_with_index do |actual_number, key|

        if actual_number % 35 == 0
          @array_of_numbers[key] = "Nama Team"
        elsif actual_number % 7 == 0
          @array_of_numbers[key] = "Team"
        elsif actual_number % 5 == 0
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
