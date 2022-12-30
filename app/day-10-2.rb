class Day10

  def readFile
    input = File.readlines('day-10.input', chomp: true)
    return input
  end

  def is_lit(x, p)
    return p >= x - 1 && p <= x + 1
  end
  def result
    input = readFile


    cycle = 1
    x = 1
    values = Array.new
    values[0] = x
    values[cycle] = x
    input.each do |instruction|
      if instruction[0, 4] == "addx"
        v = Integer(instruction.scan(/-?\d+/)[0])

        cycle = cycle + 1
        values[cycle] = x
        x = x + v
      end
      cycle = cycle + 1
      values[cycle] = x
    end

    crt = (0..5).map { (0..39).map {'.'}}
    (0..5).each do |i|
      (0..39).each do |j|
        p = 40 * i + j
        puts i.to_s + " " + j.to_s + " " + p.to_s
        if is_lit(values[p + 1], j)
          crt[i][j] = '#'
        end
      end
    end
    puts "     -----------------------   "
    print_m(crt)
    puts "     -----------------------   "
  end

  def print_m(arr)
    puts arr.map { |x| x.join(' ') }
  end
end

Day10.new.result


