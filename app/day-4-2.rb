class Day4

  def readFile
    input = File.readlines('day-4.input')
    return input
  end

  def overlaps(l)
    s = l.split(',')
    first = s[0].split('-').map { |v| Integer(v) }
    second = s[1].split('-').map { |v| Integer(v) }
    puts first.to_s + second.to_s
    r1 = first[1] >= second[0] && first[0] <= second[1]
    r2 = second[1] >= first[0] && second[0] <= first[1]
    r3 = first[0] >= second[0] && first[1] <= second[1]
    r4 = first[0] <= second[0] && first[1] >= second[1]
    puts r1.to_s + " " + r2.to_s + " " +r3.to_s + " " +r4.to_s + " "
    return r1 || r2 || r3 || r4
  end

  def result
    input = readFile
    count = 0
    input.each do |l|
      if overlaps(l)
        count += 1
      end
    end
    # not 966, 928
    puts count
  end
end

Day4.new.result