contains_count = 0
overlaps_count = 0

def ranges_overlap_completely?(range1, range2)
  if (range1.begin <= range2.begin && range1.end >= range2.end) ||
    (range2.begin <= range1.begin && range2.end >= range1.end)
    true
  else
    false
  end
end

def ranges_overlap?(range1, range2)
  if (range1.to_a & range2.to_a).any?
    true
  else
    false
  end
end

def string_to_range(str)
  first,last = str.split('-')
  (first.to_i..last.to_i)
end

File.foreach("4.txt") do |ranges|
  range1, range2 = ranges.split(',')
  range1 = string_to_range(range1)
  range2 = string_to_range(range2)

  if ranges_overlap_completely?(range1, range2)
    contains_count += 1 
  end

  if ranges_overlap?(range1, range2)
    overlaps_count += 1 
  end

end

puts "Pairs with completely overlapping ranges: #{contains_count}"
puts "Pairs with any overlapping ranges: #{overlaps_count}"