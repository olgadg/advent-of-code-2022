class Day10

  def readFile
    input = File.readlines('day-10.input', chomp: true)
    return input
  end

  def result
    input = readFile

    cycle = 1
    x = 1
    values = Array.new
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

    total = 0
    (0..values.length).each do |cycle|
      if cycle > 0 && ((cycle - 20) % 40 == 0)
        total = total + (cycle * values[cycle])
      end
    end
    puts total.to_s
  end

end

Day10.new.result


