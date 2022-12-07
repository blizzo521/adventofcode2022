# [D]                     [N] [F]    
# [H] [F]             [L] [J] [H]    
# [R] [H]             [F] [V] [G] [H]
# [Z] [Q]         [Z] [W] [L] [J] [B]
# [S] [W] [H]     [B] [H] [D] [C] [M]
# [P] [R] [S] [G] [J] [J] [W] [Z] [V]
# [W] [B] [V] [F] [G] [T] [T] [T] [P]
# [Q] [V] [C] [H] [P] [Q] [Z] [D] [W]
#  1   2   3   4   5   6   7   8   9 

stacks = {
  '1' => %w(Q W P S Z R H D),
  '2' => %w(V B R W Q H F),
  '3' => %w(C V S H),
  '4' => %w(H F G),
  '5' => %w(P G J B Z),
  '6' => %w(Q T J H W F L),
  '7' => %w(Z T W D L V J N),
  '8' => %w(D T Z C J G H F),
  '9' => %w(W P V M B H),
}


# Part 1

# File.foreach("5.txt") do |command|
#   command_parts = command.split(' ')
#   quantity = command_parts[1].to_i
#   origin = command_parts[3]
#   destination = command_parts[5]

#   quantity.times do 
#     crate = stacks[origin].pop
#     stacks[destination] = stacks[destination].append(crate)
#   end
# end



# Part 2
pp stacks
File.foreach("5.txt") do |command|
  puts "--------------------------------"
  puts command
  
  command_parts = command.split(' ')
  quantity = command_parts[1].to_i
  origin = command_parts[3]
  destination = command_parts[5]

  pp stacks[origin]
  pp stacks[destination]

  crates = stacks[origin].pop(quantity)
  puts "    Moving crates #{crates}"
  stacks[destination] = stacks[destination] + crates
  pp stacks[origin]
  pp stacks[destination]

end

tops = ""
stacks.values.each do |stack|
  tops << stack.last
end

pp tops