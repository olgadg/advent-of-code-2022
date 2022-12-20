class Day7

  def readFile
    input = File.readlines('day-7.input')
    return input
  end

  def path(parent, dir)
    dirName = parent
    if (parent[parent.length - 1] != '/')
      dirName = dirName + "/"
    end
    return dirName + dir
  end

  def up(dir)
    return dir[0, dir.rindex(/\//)]
  end

  def result
    input = readFile

    dirs = Hash.new
    unvisitedDirParents = Hash.new
    unvisitedDirs = []
    currentDir = "/"

    input.each do |command|
      if command[0, 6] == "$ cd /"
        currentDir = "/"
        if dirs[currentDir] == nil
          dirs[currentDir] = 0
        end
      elsif command[0, 7] == "$ cd .."
        currentDir = up(currentDir)
        if dirs[currentDir] == nil
          dirs[currentDir] = 0
        end
      elsif command[0, 4] == "$ cd"
        currentDir = path(currentDir, command[5, command.length - 6])
        dirs[currentDir] = 0
      elsif command[0, 4] == "$ ls"
      elsif command[0, 4] == "dir "
        dirName = path(currentDir, command[4, command.length - 5])
        if dirs[dirName] != nil
          dirs[currentDir] = dirs[currentDir] + dirs[dirName]
        elsif unvisitedDirParents[dirName] == nil
          unvisitedDirParents[dirName] = currentDir
          unvisitedDirs.append(dirName)
        end
      else
        size = Integer(command.scan(/\d+/)[0])
        dirs[currentDir] = dirs[currentDir] + size
      end
    end

    while !unvisitedDirs.empty? do
      dir = unvisitedDirs.pop
      parent = unvisitedDirParents[dir]
      should_visit = dirs[dir] != nil && !unvisitedDirs.include?(parent)
      if should_visit
        if parent != "/"
          while parent != "" do
            dirs[parent] = dirs[parent] + dirs[dir]
            parent = up(parent)
          end
        end
        dirs["/"] = dirs["/"] + dirs[dir]

      else
        unvisitedDirs.prepend(dir)
      end
    end
    puts dirs.to_s
    puts dirs.sum { |k, v| v >= 100000 ? 0 : v }
  end
end

Day7.new.result