# Exercise 2:
  # make your own enumerables

  class Array
    # Research enumerables here if you are unfamiliar with them
    # (http://ruby-doc.org/core-2.3.1/Enumerable.html)

    # - you will need to use #another_each to make your enumerables work. 
    # - do not use the standard #each inside your new methods only use #another_each provided below <<<<<<<<<<<<<<<<<<<<<
    # - research what yield does in ruby and look at the #another_each example below for reference

    def another_each
      self.length.times do |i|
        yield(self[i])
      end
    end

    # another_reject
    # Duplicates what the #reject method does. do not use #reject
    # Returns an array for all elements of enum for which the given block returns false.

    # Precode

    # def another_reject(num)
    #   another_each{ |i| if i == false} 
    #   yield(num)
    # end
    
    # Method

    def another_reject
      num_array = []
      self.another_each do |i|
        if yield(i) == false
          num_array << i
        end
      end
      num_array
    end

    # another_find
    # Duplicates what the #find method does. do not use #find
    # Returns the first element for which block is not false. if no element meets the criteria in the block #another_find will return nil
    
    # Precode

    # Method
    def another_find
      self.another_each do |i|
        if yield(i) 
          return i
        end
      end
      return nil
    end

    # another_map
    # Duplicates what the #map method does. do not use #map
    # Returns a new array with the results of running block once for every element in the original array

    # Precode
    
    # Method
    def another_map
      #use another_each
    end

  end

  # Exercise 2 Driver Code

    # another_reject test
    reject_example_array = [1, 2, 3, 4, 5]

    if reject_example_array.another_reject { |num| num.even? } == [1, 3, 5]
      puts "#another_reject - Pass"
    else
      puts "#another_reject - F"
    end

    # another_find test
    find_example_test_1 = (1..10).to_a.another_find { |i| i % 5 == 0 && i % 7 == 0 } == nil
    find_example_test_2 = (1..100).to_a.another_find { |i| i % 5 == 0 && i % 7 == 0 } == 35

    if find_example_test_1 && find_example_test_2
      puts "#another_find - Pass"
    else
      puts "#another_find - F"
    end


    # another_map test
    map_example_test_1 = [1,2,3,4].another_map { |x| x * x } == [1, 4, 9, 16]
    map_example_test_2 = [1,2,3,4].another_map { |num| num.to_s + " cat" } == ["1 cat", "2 cat", "3 cat", "4 cat"]

    if map_example_test_1 && map_example_test_2
      puts "#another_map - Pass"
    else
      puts "#another_map - F"
    end
