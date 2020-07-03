require_relative("../db/sql_runner")

class Ticket

        attr_reader :id
        attr_accessor :customer_id, :film_id

        def initialize(options)
        @id = options["id"].to_i if options["id"]
        @customer_id = options["customer_id"].to_i
        @film_id = options["film_id"].to_i
        end

        def save() # CREATE
            sql = "INSERT INTO tickets
            (customer_id, film_id)
            VALUES
            ($1, $2)
            RETURNING id"
            values = [@customer_id, @film_id]
            ticket = SqlRunner.run(sql, values)[0]
            @id = ticket["id"].to_i
        end

        def self.all() # READ
            sql = "SELECT * FROM tickets"
            tickets = SqlRunner.run(sql)
            return self.map_items(tickets)
        end

        def self.find(id) # READ
            sql = "SELECT * FROM tickets
            WHERE id = $1"
            values = [id]
            result = SqlRunner.run(sql, values)
            return Ticket.new(result[0])
        end
        
        def update() # UPDATE
            sql = "UPDATE tickets SET
            (customer_id, film_id)
            =
            ($1, $2)
            WHERE id = $3"
            values = [@customer_id, @film_id, @id]
            SqlRunner.run(sql, values)
        end

        def delete() # DELETE
            sql = "DELETE FROM tickets 
            WHERE id = $1"
            values = [@id]
            SqlRunner.run(sql, values)
        end

        def self.delete_all() # DELETE
            sql = "DELETE FROM tickets"
            SqlRunner.run(sql)
        end

        def self.map_items(data) # HELPER
            return data.map {|ticket| Ticket.new(ticket)}
        end

        # CLASS LOGIC METHODS
        def create_ticket(customer, film)
            ticket = Ticket.new({
                "customer_id" => customer.id,
                "film_id" => film.id
            })
            ticket.save()
            return ticket
        end
        
end