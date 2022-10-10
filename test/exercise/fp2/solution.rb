module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&block)
        my_reduce(MyArray.new) do |acc, element|
          acc << block.call(element)
        end
        self
      end

      # Написать свою функцию my_map
      def my_map(&block)
        my_reduce(MyArray.new) do |acc, element|
          acc << block.call(element)
        end
      end

      # Написать свою функцию my_compact
      def my_compact
        my_reduce(MyArray.new) do |acc, element|
          element.nil? ? acc : acc << element
        end
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, &block)
        collection = self
        if acc.nil?
          acc, *rest = collection
          collection = MyArray.new(rest)
        end

        return acc if collection.empty?

        first, *rest = collection
        rest = MyArray.new(rest)
        acc1 = block.call(acc, first)

        rest.my_reduce(acc1, &block)
      end
    end
  end
end
