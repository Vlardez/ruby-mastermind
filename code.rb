## Class to hold the 4-color code that is created

class Code
  def initialize(colors)
    @color_code = colors.sample(4)
  end

  def read
    @color_code.each_with_index {|c,i| puts "#{c.bg} #{c.name}, #{i} #{c.reset}" }
  end

  def check(player_code)
    colors = @color_code.map { |c| c.name }
    checker = colors.zip(player_code)
    cor_pos_col = checker.count { |i| i.reduce(:eql?) }
    cor_col = checker.uniq.count { |i| colors.include?(i) }
    result = Array.new(4, '')
    cor_pos_col.times { result.unshift('pos_col').pop }
    cor_col.times { result.unshift('col').pop }
    result
  end
end