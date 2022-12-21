class Day8

  def readFile
    input = File.readlines('day-8.input', chomp: true)
                .map { |s| s.chars.map { |v| Integer(v) } }
    return input
  end

  def is_visible_tl(v, m, x, y)
    t = x == 0 || ((0..(x - 1)).count { |i| m[i][y] >= m[x][y] } == 0)
    l = y == 0 || ((0..(y - 1)).count { |i| m[x][i] >= m[x][y] } == 0)
    return t || l
  end

  def is_visible_br(v, m, x, y)
    b = x == m.length - 1 || ((m.length - 1).downto(x + 1).count { |i| m[i][y] >= m[x][y] } == 0)
    r = y == m[x].length - 1 || ((m[0].length - 1).downto(y + 1).count { |i| m[x][i] >= m[x][y] } == 0)
    return b || r
  end

  def result
    input = readFile
    v = input.map { |r| r.map { nil } }
    (0..(input.length - 1)).each do |x|
      (0..(input[x].length - 1)).each do |y|
        v[x][y] = is_visible_tl(v, input, x, y)
      end
    end

    (input.length - 1).downto(0).each do |x|
      (input[x].length - 1).downto(0).each do |y|
        v[x][y] |= is_visible_br(v, input, x, y)
      end
    end

    puts v.sum { |r| r.count { |t| t } }
  end
end

Day8.new.result



