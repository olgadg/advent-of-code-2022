class Day2

  def readFile
    input = File.readlines('day-2-1.input')
    return input
  end

  def move_score(a)
    if a == "A"
      return 1
    elsif a == "B"
      return 2
    else a == "C"
    return 3
    end
  return 0
  end

  def move(a, b)
    if b == "X"
      if a == "A"
        return "C"
      elsif a == "B"
        return "A"
      else
        return "B"
      end
    elsif b == "Z"
      if a == "A"
        return "B"
      elsif a == "B"
        return "C"
      else
        return "A"
      end
    end
    return a
  end

  def strategy_score(a)
    if a == "X"
      return 0
    elsif a == "Y"
      return 3
    else a == "Z"
    return 6
    end
    return 0
  end


  def score
    input = readFile
    result = 0
    input.each do |a|
      result = result + move_score(move(a[0],a[2])) + strategy_score( a[2])
    end
    puts result
  end
end

Day2.new.score