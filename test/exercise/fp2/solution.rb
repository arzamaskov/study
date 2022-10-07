module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&block)
        my_reduce([]) do |acc, element|
          acc << block.call(element)
        end
        self
      end

      # Написать свою функцию my_map
      def my_map(&block)
        new_collection = MyArray.new
        collection = self

        collection.my_each do |element|
          new_collection << block.call(element)
        end

        new_collection
      end

      # Написать свою функцию my_compact
      def my_compact
        new_collection = MyArray.new
        collection = self

        collection.my_each do |element|
          new_collection << element unless element.nil?
        end

        new_collection
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, &block)
        collection = self
        acc, *collection = collection if acc.nil?

        my_iterator(collection, acc, &block)
      end

      def my_iterator(collection, acc, &block)
        return acc if collection.empty?

        first, *rest = collection

        acc1 = block.call(acc, first)

        my_iterator(rest, acc1, &block)
      end
    end
  end
end
