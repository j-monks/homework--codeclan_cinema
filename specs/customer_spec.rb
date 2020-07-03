require("minitest/autorun")
require("minitest/reporters")

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../models/customer")



class CustomerGuest < MiniTest::Test

    def setup()
        @customer1 = Customer.new({
            "name" => "James",
            "funds" => 30
        })
    end

    def test_customer_has_name
        assert_equal("James", @customer1.name)
    end

    def test_customer_has_funds
        assert_equal(30, @customer1.funds)
    end

end