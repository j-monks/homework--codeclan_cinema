require_relative("db/sql_runner")

class Customer

    def initialize(options)
        @id = options["id"].to_i if options["id"]
        @name = options["name"]
        @funds = options["funds"].to_i
    end

    def save()
        sql = "INSERT INTO customers
        VALUES
        ($1, $2)
        RETURNING ID"
        values = [@name, @funds]
        customer = SqlRunner.run(sql, values)[0]
        @id = movie["id"].to_i
    end

end