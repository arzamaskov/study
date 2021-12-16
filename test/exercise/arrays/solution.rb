module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.reduce { |larger, item| item > larger ? item : larger }
        array.map { |item| item.positive? ? max : item }
      end

      def search(array, query)
        return -1 if array.size.zero? || (array.size == 1 && array.first != query)

        left = 0
        right = array.size - 1
        middle = left + ((right - left) / 2)

        return middle if query == array[middle]

        if query > array[middle]
          counter = search(array.slice(middle + 1, right), query)
          counter == -1 ? -1 : (middle + 1) + counter
        else
          search(array.slice(left, middle), query)
        end
      end
    end
  end
end
