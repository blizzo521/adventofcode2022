PRIORITIES = [*'a'..'z', *'A'..'Z']

def priority_for(letter)
  PRIORITIES.index(letter)+1
end

RUCKSACKS = []
File.foreach("3.txt") do |contents|
  RUCKSACKS << contents.chomp
end

# Part 1
def part1
  priority_total = 0

  RUCKSACKS.each do |contents|
    compartment1 = contents[0..(contents.length/2)-1]
    compartment2 = contents[(contents.length/2)..contents.length]
    in_both = (compartment1.chars & compartment2.chars).first
  
    priority = priority_for(in_both)
    priority_total += priority
  end

  priority_total
end

# Part 2
def part2
  priority_total = 0

  RUCKSACKS.each_slice(3) do |set|
    in_all = (set[0].chars & set[1].chars & set[2].chars).first
    priority = priority_for(in_all)
    priority_total += priority
  end

  priority_total
end

priority_total = part1
puts "Total Priority for Part 1: #{priority_total}"
priority_total = part2
puts "Total Priority for Part 2: #{priority_total}"

