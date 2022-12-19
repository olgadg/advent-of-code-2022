class Day2

  def readFile
    input = File.readlines('day-2-1.input')
    return input
  end

  def move_score(a)
    if a == "X"
      return 1
    elsif a == "Y"
      return 2
    else a == "Z"
    return 3
    end
  return 0
  end

  def win_score(a, b)
    if a == "B" && b == "X" || a == "C" && b == "Y" || a == "A" && b == "Z"
      return 0
    elsif a == "A" && b == "X" || a == "B" && b == "Y" || a == "C" && b == "Z"
      return 3
    end
    return 6
  end

  def score
    input = readFile
    result = 0
    input.each do |a|
      result = result + move_score(a[2]) + win_score(a[0], a[2])
    end
    puts result
  end
end

Day2.new.score