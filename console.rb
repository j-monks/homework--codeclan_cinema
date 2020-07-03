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

customer2 = Customer.new({
    "name" => "Jim",
    "funds" => 60
})
customer2.save()

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


all_tickets = Ticket.all()
all_customers = Customer.all()
all_films = Film.all()

 binding.pry
 nil