class Day8

  def readFile
    input = File.readlines('day-8.input', chomp: true)
                .map { |s| s.chars.map { |v| Integer(v) } }
    return input
  end

  def viewing_dt(m, x, y)
    count = 0
    (x - 1).downto(0).each do |i|
      if m[i][y] < m[x][y]
        count += 1
      else
        count += 1
        break
      end
    end
    return count
  end

  def viewing_dl(m, x, y)
    count = 0
    (y - 1).downto(0).each do |i|
      if m[x][i] < m[x][y]
        count += 1
      else
        count += 1
        break
      end
    end
    return count
  end

  def viewing_db(m, x, y)
    count = 0
    ((x + 1)..(m.length - 1)).each do |i|
      if m[i][y] < m[x][y]
        count += 1
      else
        count += 1
        break
      end
    end
    return count
  end

  def viewing_dr(m, x, y)
    count = 0
    ((y + 1)..(m[0].length - 1)).each do |i|
      if m[x][i] < m[x][y]
        count += 1
      else
        count += 1
        break
      end
    end
    return count
  end

  def result3
    input = readFile
    s = input.map { |r| r.map { 0 } }
    (1..(input.length - 2)).each do |x|
      (1..(input[x].length - 2)).each do |y|
        s[x][y] = viewing_dt(input, x, y) * viewing_dl(input, x, y)
      end
    end

    (input.length - 2).downto(1).each do |x|
      (input[x].length - 2).downto(1).each do |y|
        s[x][y] = s[x][y] * viewing_db(input, x, y) * viewing_dr(input, x, y)
      end
    end

    maxX = -1
    maxY = -1
    max = 0
    (0..(input.length - 1)).each do |x|
      (0..(input[x].length - 1)).each do |y|
        if (s[x][y] > max)
          maxX = x
          maxY = y
          max = s[x][y]
        end
      end
    end
    puts "x=" + maxX.to_s + " y=" + maxY.to_s + " max=" + max.to_s
  end

end

Day8.new.result3



