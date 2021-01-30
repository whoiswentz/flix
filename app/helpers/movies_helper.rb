module MoviesHelper
    def format_gross(movie)
        movie.flop? ? "Flop" : number_to_currency(movie.total_gross, precision: 0) 
    end

    def year_of(movie)
        movie.released_on ? movie.released_on.strftime("%Y") : "Unreleased"
    end
end