require("pry-byebug")
require_relative("models/ticket")
require_relative("models/customer.rb")
require_relative("models/film")

Ticket.delete_all()
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
    "price" => 9,
    "show_time" => "20:00"
})
film1.save()

film2 = Film.new({
    "title" => "Fight Club",
    "price" => 5,
    "show_time" => "16:00"
})
film2.save()

# TICKET
ticket = Ticket.new({})

# VARIABLES
all_tickets = Ticket.all()
all_customers = Customer.all()
all_films = Film.all()

# BOUGHT TICKETS
ticket = ticket.sell_ticket_to_customer(customer1, film2)
ticket = ticket.sell_ticket_to_customer(customer2, film2)

# CHECK HOW MANY TICKETS WERE BOUGHT BY A CUSTOMER
customer1.ticket_count()

# CHECK HOW MANY CUSTOMERS ARE GOING TO WATCH A CERTAIN FILM
film2.customer_count()

 binding.pry
 nil