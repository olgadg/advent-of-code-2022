class Day3

  def readFile
    input = File.readlines('day-3.input')
    return input
  end

  def intersection(a)
    first = a[0, a.length / 2].chars
    second = a[a.length / 2, a.length - 1].chars
    return first & second
  end

  def priority(a)
    value = a.ord
    if value < 97
      return value - 65 + 27
    else
      return value - 97 + 1
    end
  end

  def result

    input = readFile
    acc = 0
    input.map do |a|
      common = intersection(a)
      common.map do |v|

        acc = acc + priority(v)
      end
    end
    puts acc
  end
end

Day3.new.result