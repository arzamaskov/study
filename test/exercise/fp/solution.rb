module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]

      def get_films_by_rating(array)
        array.select { |film| film if film['rating_kinopoisk'].present? && !film['rating_kinopoisk'].to_f.zero? }
      end

      def get_films_by_country(array)
        array.select { |film| film if film['country'].present? && film['country'].split(',').size > 1 }
      end

      def rating(array)
        films = get_films_by_country(get_films_by_rating(array))
        rating_kinopoisk = films.map { |film| film['rating_kinopoisk'].to_f }
        rating_kinopoisk.reduce(:+) / rating_kinopoisk.size
      end

      def chars_count(films, threshold)
        film_names = films.select { |film| film if film['rating_kinopoisk'].to_f >= threshold }

        film_names.map { |film| film['name'].count('и') }.reduce(:+)
      end
    end
  end
end
