class Day4

  def readFile
    input = File.readlines('day-4.input')
    return input
  end

  def contains(l)
    s = l.split(',')
    first = s[0].split('-').map { |v| Integer(v)}
    second = s[1].split('-').map { |v| Integer(v)}
    return first[0] >= second[0] && first[1] <= second[1] ||
      first[0] <= second[0] && first[1] >= second[1]
  end


  def result
    input = readFile
    count = 0
    input.each do |l|
      if contains(l)
        count += 1
      end
    end
    puts count
  end
end

Day4.new.result