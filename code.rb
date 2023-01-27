## Class to hold the 4-color code that is created
require_relative 'constants'

class Code
  include Unicode_Symbols

  def initialize(colors)
    @color_code = 4.times.map {colors.sample}
  end

  def read
    @color_code.each_with_index { |c, i| puts "#{c.bg} #{c.id}, #{i} #{c.reset}" }
  end

  def check(player_code)
    colors = @color_code.map(&:id)
    cor_pos_col = []
    cor_col = []
    p player_code
    player_code.each_with_index do |c, i|
      if c == colors[i]
        cor_pos_col << i
        player_code[i] = 'X' # removes that color from consideration
        colors[i] = 'x'
      end
    end
    p player_code
    player_code.each_with_index do |c, i|
      if colors.include?(c)
        cor_col << i
        player_code[i] = 'X'
        colors[colors.find_index(c)] = 'x'
      end
    end
    p player_code
    cor_pos_col.length.times { print CHECKMARK }
    cor_col.length.times { print "#{PEG} " }
    print "\n"
    p cor_pos_col
    p cor_col
  end
end