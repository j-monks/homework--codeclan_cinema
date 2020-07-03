require("minitest/autorun")
require("minitest/reporters")

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../models/customer")
require_relative("../models/film")



class CustomerGuest < MiniTest::Test

    def setup()
        @customer1 = Customer.new({
            "name" => "James",
            "funds" => 30
        })

        @film1 = Film.new({
            "title" => "Pulp Fiction",
            "price" => 9
        }) 
    end

    def test_customer_has_name
        assert_equal("James", @customer1.name)
    end

    def test_customer_has_funds
        assert_equal(30, @customer1.funds)
    end

    def test_sufficient_funds__true_if_enough
        assert_equal(true, @customer1.sufficient_funds?(@film1.price))
    end

    def test_sufficient_funds__false_if_not_enough
        poor_customer = Customer.new({
            "name" => "Kayley",
            "funds" => 5
        })
        assert_equal(false, poor_customer.sufficient_funds?(@film1.price))
    end
    
end