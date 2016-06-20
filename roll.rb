# returns either 0 or 1 
def coin_flip
  rand(2)
end

# returns an array of 6 coin_flip instances
def random_roll
  rolls = []
  i = 1
  while i < 7
    rolls << coin_flip
    i += 1
  end
rolls
end 

# creates a hash of binary numbers pointing to corresponding value/numbers
# runs random_roll and grabs the first four numbers turning them into a string
# checks to see if the 'binary code' return matches a value in the store array
# it will either return an integer or nil
def roll_number
  store = {"0, 0, 0, 1" =>  1, "0, 0, 1, 0" => 2, "0, 0, 1, 1" => 3, "0, 1, 0, 0" => 4, "0, 1, 0, 1" => 5, "0, 1, 1, 0" => 6}
  array = random_roll[0..3].join(", ")
  if store.include?(array)
    store["#{array}"]
  end
end

# sets an array of valid_numbers which includes 1..6
# sets 'checker' variable to the return value of roll_number
# checks to see if the valid_numbers array includes that number
# if so, the number is returned
# if the number isn't included in the array (meaning not nil), then run the method until then
# once the number is included 
def number_checker
  x = [1, 2, 3, 4, 5, 6]
  checker = roll_number
  new_checker = ""
  if x.include?(checker)
    checker
  else
    until x.include?(new_checker)
      new_checker = roll_number
    end
    new_checker
  end
end

#this runs the method one hundred times to see that there isn't a 
# heavy distribution/lean towards the number 3, which is what coin_flip total would
#lean to on average 
def one_hundred_times_counter
  all_counter = 100.times.map { number_checker  }
  all_counter.inject(Hash.new(0)) {|total, e| total[e] += 1; total}
end

puts one_hundred_times_counter
puts "Dice Roll: #{number_checker} & #{number_checker}"  
