require 'pp'

calories = []

calorie_count = 0
File.foreach("1.txt") do |line|
    if line == "\n"
        calories << calorie_count
        calorie_count = 0
    else
        calorie_count += line.to_i
    end
end

calories.sort!

top_elf = calories.sort.last
top_elves = calories[calories.length-3..calories.length].sum


puts "Elf carrying the most calories: #{top_elf}"
puts "Elves carrying three most calories: #{top_elves}"
