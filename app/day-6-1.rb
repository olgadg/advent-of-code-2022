class Day6

  def readFile
    input = File.readlines('day-6.input')
    return input
  end

  def result
    input = readFile[0]
    (0..input.length - 4).each do |i|
      marker = input[i, 4]
      found = marker.chars.uniq.count { |char| marker.count(char) > 1 } == 0
      if found
        puts "found at " + (i + 4) .to_s  + " " + marker
        break
      end
    end
  end
end

Day6.new.result