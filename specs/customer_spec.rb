require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require 'minitest/pride'
require_relative '../lib/customer'

# TODO: uncomment the next line once you start wave 3
# require_relative '../lib/customer'

describe "Customer" do
  describe "#initialize" do
    it "Takes an ID, email and address info" do
      # TODO: Your test code here!
      #SET UP VARIABLES
      #CALL THE METHOD BEING TESTED
      #CHECK RESULT OF THAT METHOD
      id = 13
      email = "sim@wyman.name"
      address = "4197 Schuster Points"
      city = "Lebsackshire"
      state = "NH"
      zip = "13687-5985"

      customer = Grocery::Customer.new(id, email, address, city, state, zip)
      customer.must_respond_to :id
      customer.id.must_be_kind_of Integer

      customer.must_respond_to :email
      customer.email.must_be_kind_of String

      customer.must_respond_to :address
      customer.address.must_be_kind_of String
    end
  end

  describe "Customer.all" do
    it "Returns an array of all customers" do
      # TODO: Your test code here!
      id = 13
      email = "sim@wyman.name"
      address = "4197 Schuster Points"
      city = "Lebsackshire"
      state = "NH"
      zip = "13687-5985"

      customer = Grocery::Customer.new(id, email, address, city, state, zip)

      # Useful checks might include:
      #   - Customer.all returns an array
      Grocery::Customer.all.must_be_kind_of Array
      #   - Everything in the array is a Customer
      customer.must_be_instance_of Grocery::Customer
      #   - The number of orders is correct
      Grocery::Customer.all.length.must_equal 35
      #   - The ID, email address of the first and last
      #       customer match what's in the CSV file

      # Feel free to split this into multiple tests if needed
    end
  end

  describe "Customer.find" do
    it "Can find the first customer from the CSV" do
      # TODO: Your test code here!
        Grocery::Customer.find(1).must_be_instance_of Grocery::Customer
    end

    it "Can find the last customer from the CSV" do
      # TODO: Your test code here!
      Grocery::Customer.find(35).must_be_instance_of Grocery::Customer 
    end

    it "Raises an error for a customer that doesn't exist" do
      # TODO: Your test code here!
      proc { Grocery::Customer.find(107) }.must_raise ArgumentError
    end
  end
end
