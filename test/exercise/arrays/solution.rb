module Exercise
  module Arrays
    class << self
      def get_max(array)
        array.reduce { |larger, item| item > larger ? item : larger }
      end

      def replace(array)
        max = get_max(array)
        array.map { |item| item.positive? ? max : item }
      end

      def search(array, query)
        return -1 if array.size.zero? || (array.size == 1 && array.first != query)

        iter = lambda do |left, right|
          middle = left + ((right - left) / 2)

          if left >= right
            return array[left] == query ? left : -1
          end

          return middle if query == array[middle]

          return array[middle] > query ? iter.call(left, middle) : iter.call(middle + 1, right)
        end

        iter.call(0, array.size - 1)
      end
    end
  end
end
