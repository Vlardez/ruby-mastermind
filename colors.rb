class Color
  attr_reader :name, :bg, :text

  def initialize(name, col)
    @name = name
    @bg = "\e[48;5;#{col}m"
    @text = "\e[38;5;#{col}m"
  end

  def reset
    "\e[0m"
  end
end