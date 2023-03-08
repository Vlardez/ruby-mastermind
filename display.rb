## class for displaying various prompts and graphics
class Display
  class << self
    def player_guess
      puts 'Please try to guess the code. Enter in four single digits corresponding to the above color legend.'
      input = gets.strip.split('')
      input.map!(&:to_i)
      input.delete(0)
      input
    end

    def color_reference
      puts 'Here are your color choices:'
      COLORS.each { |c| print "#{c.bg} #{c.id} " }
      puts "#{Color.reset} \n"
    end
  end
end
