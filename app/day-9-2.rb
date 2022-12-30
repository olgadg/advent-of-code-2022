class Day9

  def readFile
    input = File.readlines('day-9.input', chomp: true)
    return input
  end

  def do_move_head(p, d)
    if d == 'U'
      p[0] = p[0] + 1
    elsif d == 'D'
      p[0] = p[0] - 1
    elsif d == 'L'
      p[1] = p[1] - 1
    elsif d == 'R'
      p[1] = p[1] + 1
    end
  end

  def do_move_tail(h_p, t_p)
    if h_p[0] == t_p[0]
      if (h_p[1] - t_p[1]) > 1
        t_p[1] = t_p[1] + 1
      elsif (t_p[1] - h_p[1]) > 1
        t_p[1] = t_p[1] - 1
      end
    elsif h_p[1] == t_p[1]
      if (h_p[0] - t_p[0]) > 1
        t_p[0] = t_p[0] + 1
      elsif (t_p[0] - h_p[0]) > 1
        t_p[0] = t_p[0] - 1
      end
    elsif (h_p[0] - t_p[0]).abs > 1 || (h_p[1] - t_p[1]).abs > 1
      if (h_p[1] - t_p[1]) > 0
        t_p[1] = t_p[1] + 1
      elsif (t_p[1] - h_p[1]) > 0
        t_p[1] = t_p[1] - 1
      end

      if (h_p[0] - t_p[0]) > 0
        t_p[0] = t_p[0] + 1
      elsif (t_p[0] - h_p[0]) > 0
        t_p[0] = t_p[0] - 1
      end
    end
  end

  def print_m(arr)
    puts arr.map { |x| x.join(' ') }
  end

  def result
    input = readFile

    r = 1
    u = 1
    max_r = 0
    max_u = 0
    input.each do |move|
      a = Integer(move.scan(/\d+/)[0])
      if move[0] == 'U'
        u = u + a
        if u > max_u
          max_u = u
        end
      elsif move[0] == 'D'
        u = [u - a, 0].max
      elsif move[0] == 'L'
        r = [r - a, 0].max
      elsif move[0] == 'R'
        r = r + a
        if r > max_r
          max_r = r
        end
      end
    end

    v = (0..max_u).map { (0..max_r).map { '.' } }
    h_p = [0, 0]
    knots = (0..9).map { [0, 0] }
    count = 0
    input.each do |move|
      steps = Integer(move.scan(/\d+/)[0])
      (1..steps).each do |i|
        do_move_head(h_p, move[0])
        current_h = h_p
        knots.each do |k|
          do_move_tail(current_h, k)
          current_h = k
        end
        v[knots[8][0]][knots[8][1]] = '#'
      end
      count = count + 1
    end

    puts v.sum { |r| r.count { |t| t == '#' } }
  end
end

Day9.new.result

