require_relative 'constants'
## class that contains and describes a 'Color'
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