class Code
  def initialize(colors)
    @color_code = colors.sample(4)
  end

  def read
    @color_code.each_with_index {|c,i| puts "#{c.bg} #{c.name}, #{i} #{c.reset}" }
  end

end
