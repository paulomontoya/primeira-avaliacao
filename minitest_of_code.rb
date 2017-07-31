
require 'prime'
require 'minitest/spec'
require 'minitest/autorun'
require './nama_test'

describe NamaTest do
  before do
    @nama_test = NamaTest.new
  end

  describe 'o array dos números' do
    it 'não pode ser nulo' do
      @nama_test.array_of_numbers = nil
      proc { @nama_test.print_final_result }.must_raise ArgumentError
    end
  end

  describe 'o array dos números' do
    it 'não pode ser um número inteiro' do
      @nama_test.array_of_numbers = 1
      proc { @nama_test.print_final_result }.must_raise ArgumentError
    end
  end

  describe 'o array dos números' do
    it 'não pode ser uma hash' do
      @nama_test.array_of_numbers = Hash.new(2)
      proc { @nama_test.print_final_result }.must_raise ArgumentError
    end
  end

  describe 'array apenas com um número par e primo' do
    it 'deve retonar apenas "Go Nama"' do
      @nama_test.array_of_numbers = Array(2)
      @nama_test.print_final_result.must_equal('Go Nama')
    end
  end

  describe 'array apenas com um número par' do
    it 'deve retonar apenas "Go"' do
      @nama_test.array_of_numbers = Array(4)
      @nama_test.print_final_result.must_equal('Go')
    end
  end

  describe 'array apenas com um número primo' do
    it 'deve retonar apenas "Nama"' do
      @nama_test.array_of_numbers = Array(5)
      @nama_test.print_final_result.must_equal('Nama')
    end
  end

  describe 'array que não são par ou primo' do
    it 'deve retonar o próprio número' do
      array_of_numbers_test = Array(1..100)

      array_of_numbers_test.delete_if do |actual_number|
        true if actual_number.even? || Prime.prime?(actual_number)
      end

      @nama_test.array_of_numbers = array_of_numbers_test
      @nama_test.print_final_result.wont_match(/(Nama|Go)/)
    end
  end
end
