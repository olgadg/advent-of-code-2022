class Day1

  def readFile
    index = 0
    input = [a = []]
    input.append([])
    File.readlines('day-1-1.input').each do |line|
      if line.length == 1
        index = index + 1
        input[index] = []
      else
        input[index].append(Integer(line))
      end
    end
    return input
  end

  def totalCalories
    input = readFile
    max = 0
    input.map do |a|
      acc = 0
      a.each do |i|
        acc = acc + i
      end
      if acc > max
        max = acc
      end
    end
    puts max
  end
end

Day1.new.totalCalories