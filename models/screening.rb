require_relative("../db/sql_runner")

class Screening

    attr_reader :id
    attr_accessor :show_time, :film_title

    def initialize(options)
        @id = options["id"].to_i if options["id"]
        @show_time = options["show_time"] 
        @film_title = options["film_title"]
    end

    def save() # CREATE
        sql = "INSERT INTO screenings
        (show_time, film_title)
        VALUES
        ($1, $2)
        RETURNING id"
        values = [@show_time, @film_title]
        screening = SqlRunner.run(sql, values)[0]
        @id = screening["id"].to_i
    end

    def self.delete_all() # DELETE
        sql = "DELETE FROM screenings"
        SqlRunner.run(sql)
    end

end