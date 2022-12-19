require 'enumerator'

class Day3

  def readFile
    input = File.readlines('day-3.input').map { |l| l[0, l.length - 1] }
    return input
  end

  def intersection(a)
    return a[0].chars & a[1].chars & a[2].chars
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
    input.each_slice(3) do |a|
      if a.length > 0
        common = intersection(a)
        common.map do |v|
          acc = acc + priority(v)
        end
      end
    end
    puts acc
  end
end

Day3.new.result