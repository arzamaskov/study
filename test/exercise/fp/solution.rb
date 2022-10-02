module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def film_filter(film)
        film if film['country'] && film['country'].split(',').size > 1 && !film['rating_kinopoisk'].to_f.zero?
      end

      def rating(array)
        filtered_films = array.map { |film| film_filter(film) }.compact
        ratings_kinopoisk = filtered_films.map { |film| film['rating_kinopoisk'].to_f }.compact
        ratings_kinopoisk.reduce(:+) / ratings_kinopoisk.size
      end

      def get_name(film, threshold)
        film['name'] if film['rating_kinopoisk'].to_f > threshold
      end

      def chars_count(films, threshold)
        names = films.map { |film| get_name(film, threshold) }.compact
        names.map { |name| name.count('и') }.reduce(:+)
      end
    end
  end
end
