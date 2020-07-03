require("pry-byebug")
require_relative("models/ticket")
require_relative("models/customer.rb")
require_relative("models/film")

# Ticket.delete_all()
Customer.delete_all()
Film.delete_all()


# CUSTOMERS
customer1 = Customer.new({
    "name" => "James",
    "funds" => 30
})
customer1.save()


# FILMS
film1 = Film.new({
    "title" => "Pulp Fiction",
    "price" => 9
})
film1.save()

# TICKETS
ticket1 = Ticket.new({
    "customer_id" => customer1.id,
    "film_id" => film1.id
})
ticket1.save()









 binding.pry
 nil