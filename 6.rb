stream = File.open('6.txt', &:readline)
marker_length = 14

marker_found = false
offset = 0
while !marker_found
  section = stream.slice(offset,marker_length)
  
  if section.chars.uniq.length == marker_length
    marker_found = true
  else
    offset += 1
  end
end

puts "marker found at #{offset + marker_length}"
