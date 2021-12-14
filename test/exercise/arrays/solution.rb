module Exercise
  module Arrays
    class << self
      def replace(array)
        result = []
        array.each do |item|
          result << (item.positive? ? array.max : item)
        end
        result
      end

      def search(array, query)
        left = -1
        right = array.size

        while right - left > 1
          middle = left + ((right - left) / 2)

          if array[middle] >= query
            right = middle
          else
            left = middle
          end
        end

        if array[right] == query
          right
        else
          -1
        end
      end
    end
  end
end
