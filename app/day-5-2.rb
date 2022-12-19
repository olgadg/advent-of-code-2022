class Day5

  def readFile
    input = File.readlines('day-5.input')
    return input
  end

  def to_crates(a, x, y)
    crates = [[]]
    (0..y - 1).each { |j|
      crates[j] = []
      (0..x - 1).each do |i|
        v = a[i][j * 4 + 1]
        if v != ' ' && v != nil
          crates[j].append(v)
        end
      end
    }
    return crates
  end

  def to_move (str)
    return str.scan(/\d+/).map { |i| Integer(i) }
  end

  def apply_move(crates, move)
    moving = []
    (0..move[0] - 1).map do |i|
      crate = crates[move[1] - 1].shift
      moving.prepend(crate)
    end
    moving.each do |crate|
      crates[move[2] - 1].prepend(crate)
    end
    return crates
  end

  def result
    input = readFile
    crates = to_crates(input, 8, 9)
    puts crates.to_s
    moves = (10..input.length - 1).map { |i| to_move(input[i]) }

    moves.each do |move|
      apply_move(crates, move)
      puts crates.to_s
    end
    puts crates.to_s
    puts crates.map { |a| a[0] }.join()
  end
end

Day5.new.result