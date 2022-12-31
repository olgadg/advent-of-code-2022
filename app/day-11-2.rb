class Monkey
  class_attribute :id, :items, :op, :op_amount, :test_div, :if_true, :if_false, :inspected

  def to_s
    "id:#{self.id.to_s} items:#{self.items.to_s} op: #{self.op} op_amount: #{self.op_amount} test_div: #{self.test_div} if_true: #{self.if_true} if_false: #{self.if_false} inspected: #{self.inspected} "
  end
end

class Day11

  def readFile
    monkeys = Array.new
    input = File.readlines('day-11.input', chomp: true)
    index = 0
    while index < input.length do
      m = Monkey.new
      m.id = Integer(input[index].scan(/\d+/)[0])
      m.items = input[index + 1].scan(/\d+/).map { |n| Integer(n) }
      m.op = input[index + 2].scan(/[+,*]/)[0]
      m.op_amount = input[index + 2].scan(/\d+/)[0]
      m.test_div = Integer(input[index + 3].scan(/\d+/)[0])
      m.if_true = Integer(input[index + 4].scan(/\d+/)[0])
      m.if_false = Integer(input[index + 5].scan(/\d+/)[0])
      m.inspected = 0
      monkeys.push(m)

      index = index + 7
    end

    return monkeys
  end

  def inspect(m, item)
    #puts "inspect --- " + item.to_s + "    " + m.op.to_s + " " + m.op_amount.to_s

    if m.op_amount == nil
      amount = item
    else
      amount = Integer(m.op_amount)
    end
    if m.op == '+'
      new_item = item + amount
    elsif m.op == '*'
      new_item = item * amount
    end
    #puts "inspect --- " + new_item.to_s
    return new_item
  end

  def pass(monkey, item)
    #puts "pass --- " + item.to_s + "    " + monkey.test_div.to_s
    if (item % monkey.test_div) == 0
      return monkey.if_true
    else
      return monkey.if_false
    end

  end

  def round(monkeys, div)

    monkeys.each do |monkey|
      #puts monkey.to_s
      items = monkey.items
      monkey.items = []
      items.each do |item|
        new_item = inspect(monkey, item)
        monkey.inspected = monkey.inspected + 1
        new_item = new_item % div
        new_id = pass(monkey, new_item)
        #puts "pass " + new_id.to_s
        monkeys[new_id].items.push(new_item)
      end
    end
  end

  def result
    monkeys = readFile

    div = monkeys.map { |m| m.test_div  }.inject(:*)
    puts div
    (0..9999).each do |i|
      round(monkeys, div)
      puts " ----- " + (i + 1).to_s + " ------ "
      # monkeys.each do |monkey|
      #   puts monkey.to_s
      # end
    end
    puts " ----- "
    sorted = monkeys.map { |m| m.inspected }.sort
    puts sorted.to_s
    puts (sorted[sorted.length - 2] * sorted[sorted.length - 1]).to_s
    # monkeys.each do |monkey|
    #   puts monkey.to_s
    # end
  end

end

Day11.new.result

# m = Monkey.new
# m.id = 1
# m.items = [200, 300]
# puts m.id.to_s
# puts m.items.to_s



