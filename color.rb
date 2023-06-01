require_relative 'constants'
## class that contains and describes a 'Color'

# color setup
COLOR_CODES = {
  1 => 124, # red
  2 => 28, # green
  3 => 142, # yellow
  4 => 21, # blue
  5 => 99, # magenta
  6 => 45 # cyan
}

class Color
  attr_reader :id, :bg, :text

  def initialize(id, col)
    @id = id
    @bg = "\e[48;5;#{col}m"
    @text = "\e[38;5;#{col}m"
  end

  def self.reset
    "\e[0m"
  end
end

COLORS = COLOR_CODES.map { |name, code| Color.new(name, code) }