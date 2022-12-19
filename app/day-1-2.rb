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
    totals = input.map do |a|
      acc = 0
      a.each do |i|
        acc = acc + i
      end
      acc
    end
    result = totals.sort
    puts result[result.length - 1] + result[result.length - 2] + result[result.length - 3]
  end
end

Day1.new.totalCalories