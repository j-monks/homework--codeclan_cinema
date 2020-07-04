require_relative("../db/sql_runner")

class Film

    attr_reader :id
    attr_accessor :title, :price

    def initialize(options)
        @id = options["id"].to_i if options["id"]
        @show_time = options["show_time"] 
        @film_name = options["price"].to_i  
    end

    

end