
  require 'minitest/spec'
  require 'minitest/autorun'
  require './nama_test'

  describe NamaTest do

    before do
      @nama_test = NamaTest.new
    end

    describe "o array dos números" do
      it "não pode ser nulo" do
        @nama_test.array_of_numbers = nil
        proc {@nama_test.print_final_result}.must_raise ArgumentError
      end
    end

    describe "o array dos números" do
      it "não pode ser um número inteiro" do
        @nama_test.array_of_numbers = 1
        proc {@nama_test.print_final_result}.must_raise ArgumentError
      end
    end

    describe "o array dos números" do
      it "não pode ser uma hash" do
        @nama_test.array_of_numbers = Hash.new(2)
        proc {@nama_test.print_final_result}.must_raise ArgumentError
      end
    end

    describe "array apenas com o 35" do
      it "deve retonar apenas 'Nama Team'" do
        @nama_test.array_of_numbers = Array(35)
        @nama_test.print_final_result.must_equal("Nama Team")
      end
    end

    describe "array apenas com o 7" do
      it "deve retonar apenas 'Team'" do
        @nama_test.array_of_numbers = Array(7)
        @nama_test.print_final_result.must_equal("Team")
      end
    end

    describe "array apenas com o 5" do
      it "deve retonar apenas 'Nama'" do
        @nama_test.array_of_numbers = Array(5)
        @nama_test.print_final_result.must_equal("Nama")
      end
    end

    describe "array com números não múltiplos de 5, 7 e 35" do
      it "deve retonar o próprio número" do
        array_of_numbers_test = Array(1..100)
        
        array_of_numbers_test.delete_if do |actual_number|
          if (actual_number % 35 == 0) || (actual_number % 7 == 0) || actual_number % 5 == 0
            true
          end
        end

        @nama_test.array_of_numbers = array_of_numbers_test
        @nama_test.print_final_result.wont_match(/(Nama|Team)/)
      end
    end

  end
