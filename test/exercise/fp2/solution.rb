module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&block)
        return if empty?

        first, *rest = self
        block.call(first)
        MyArray.new(rest).my_each(&block)

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
        first, *rest = self

        return acc if empty?

        acc = acc.nil? ? first : block.call(acc, first)

        MyArray.new(rest).my_reduce(acc, &block)
      end
    end
  end
end
