require 'benchmark'


def test_performance_of_shovel_operator_and_equal_add_operator
    array = []
    time_shovel = Benchmark.realtime do
        10000.times { array << "new element" }
    end
    newArray = []

    time_equal_add = Benchmark.realtime do
        10000.times { newArray +=  ["new element"] }
    end

    puts "Time for << operator: #{time_shovel}"
    puts "Time for += operator: #{time_equal_add}"
    
end

# test_performance_of_shovel_operator_and_equal_add_operator()

def test_performance_on_getting_an_symbol
    
    time_symbol = Benchmark.realtime do 
        10000.times { Symbol.all_symbols.include?(:test_performance_on_getting_an_symbol)}
    end
    symbols_as_strings = []
    convert_time = Benchmark.realtime do
        symbols_as_strings = Symbol.all_symbols.map { |x| x.to_s }
    end
    time_string = Benchmark.realtime do
        10000.times { symbols_as_strings.include?("test_performance_on_getting_an_symbol")}
    end

    puts "Time for symbol: #{time_symbol}"
    puts "Time for string: #{time_string}"
    puts "Time for convert: #{convert_time}"
end

#test_performance_on_getting_an_symbol()


def test_performace_on_dynamically_create_symbols
    time_dinamically_symbols = Benchmark.realtime do
        1000000.times { ("cats" + "And" + "dogs").to_sym}
    end

    time_dinamically_symbols2 = Benchmark.realtime do
        1000000.times { ("catsAnd" + "dogs").to_sym}
    end

    time_dinamically_symbols3 = Benchmark.realtime do
        1000000.times { ("catsAndDogs").to_sym}
    end

    time_static_symbols = Benchmark.realtime do
        1000000.times { :catsAndDogs}
    end

    
    puts "Time for static symbols: #{time_static_symbols}"
    puts "Time for dinamically symbols: #{time_dinamically_symbols}"
    puts "Time for dinamically symbols2: #{time_dinamically_symbols2}"
    puts "Time for dinamically symbols3: #{time_dinamically_symbols3}"
end

#test_performace_on_dynamically_create_symbols()


def test_string_performace
    time_string1 = Benchmark.realtime do
        1000000.times { "catsAndDogs"}
    end

    time_string2 = Benchmark.realtime do
        1000000.times { "catsAnd" + "Dogs"}
    end

    time_string3 = Benchmark.realtime do
        1000000.times { "cats" + "And" + "Dogs"}
    end
    dogs = "dogs"
    cats = "Cats"

    time_string4 = Benchmark.realtime do
        1000000.times { "#{cats}And#{dogs}"}
    end

    time_string5 = Benchmark.realtime do
        1000000.times { "catsAnd#{dogs}"}
    end

    puts "Time for string: #{time_string1}"
    puts "Time for string2: #{time_string2}"
    puts "Time for string3: #{time_string3}"
    puts "Time for string4: #{time_string4}"
    puts "Time for string5: #{time_string5}"
end

#test_string_performace()

# puts nil.object_id

def test_nil_performance

    time_opt1 = Benchmark.realtime do
        10000000.times { nil.nil? }
    end

    time_opt2 = Benchmark.realtime do
        10000000.times { nil == nil }
    end

    puts "Time for nil.nil?: #{time_opt1}"
    puts "Time for nil == nil: #{time_opt2}"
end



#test_nil_performance()

def test_hash_acess_performance
    hash = { "key" => "value", "key2" => "value2", "key3" => "value3", "key4" => "value4", "key5" => "value5" }
    time_hash_with_brackets = Benchmark.realtime do
        10000000.times { hash["key3"] }
    end

    time_hash_with_fetch = Benchmark.realtime do
        10000000.times { hash.fetch("key3") }
    end

    puts "Time for hash with brackets: #{time_hash_with_brackets}"
    puts "Time for hash with fetch: #{time_hash_with_fetch}"
end

# test_hash_acess_performance()

def test_perf_collect_and_map
    array = [1,2,3]
    other = [1,2,3]

    time_map = Benchmark.realtime do
        1000000.times { array.map { |item| item + 10 }} 
    end

    time_collect =  Benchmark.realtime do
        1000000.times {other.collect { |item| item + 10}}
    end

    puts "Time for collect: #{time_collect}"
    puts "Time for Map: #{time_map}"
    # Has no big diff between then
    # Time for collect: 0.12643699999898672
    # Time for Map: 0.13147100000060163
end

# test_perf_collect_and_map()


def test_perf_aways_of_opening_a_file
    filename = "example_file.txt"
    time_file_open = Benchmark.realtime do 
        100000.times { 
            File.open(filename) do |file|
                upcase_lines = file.map { |line| line.strip.upcase }
            end
        }
    end

    

    time_instance = Benchmark.realtime do 
        100000.times { 
            file = File.open(filename)
            upcase_lines = file.map { |line| line.strip.upcase }
        }
    end

    puts "Time to use File.open(filename) #{time_file_open}"
    puts "Time to use File.open(filename) with instance creation #{time_instance}"
end

# test_perf_aways_of_opening_a_file()


