require_relative 'constants'
## Class to hold the 4-color code that is created
class Code
  include UnicodeSymbols

  def initialize(colors)
    @color_code = 4.times.map {colors.sample}
  end

  def read
    print 'The code is '
    @color_code.each { |c| print "#{c.bg} #{c.id} #{Color.reset}" }
    print "\n"
  end

  def check(player_code)
    colors = @color_code.map(&:id)
    cor_pos_col = []
    cor_col = []
    player_code.each_with_index do |c, i|
      if c == colors[i]
        cor_pos_col << i
        player_code[i] = 'X' # removes that color from consideration
        colors[i] = 'x'
      end
    end
    player_code.each_with_index do |c, i|
      if colors.include?(c)
        cor_col << i
        player_code[i] = 'X'
        colors[colors.find_index(c)] = 'x'
      end
    end
    cor_pos_col.length.times { print "#{COLORS[5].text}#{PEG} #{Color.reset}" }
    cor_col.length.times { print "#{PEG} " }
    print "\n"
    cor_pos_col.length == 4
  end
end
