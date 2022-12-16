class Color
  COLORS = {
    BLACK: 16,
    RED: 124,
    GREEN: 28,
    YELLOW: 142,
    BLUE: 21,
    MAGENTA: 99,
    CYAN: 45,
    WHITE: 111
  }

  def self.c(color, mod = 48)
    case mod
    when 'text'
      "\e[38;5;#{COLORS[color]}m"
    else
      "\e[48;5;#{COLORS[color]}m"
    end
  end

  def self.reset
    "\e[0m"
  end
end

puts "#{Color.c(:RED)} test #{Color.reset}"
