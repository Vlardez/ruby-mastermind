## class for displaying various prompts and graphics
class Display
  class << self
    def player_guess
      input = gets.strip.split('')
      input.map!(&:to_i)
      input.delete(0)
      input
    end

    def prompt(prompt)
      puts prompt.to_s
      gets.strip.capitalize
    end

    def color_reference
      puts 'Here are your color choices:'
      COLORS.each { |c| print "#{c.bg} #{c.id} " }
      puts "#{Color.reset} \n"
    end

    def exit_message
      puts "#{COLORS[3].text} Thank you for playing, have a nice day! #{Color.reset}"
    end

    def result(winner)
      if winner == 20
        puts "#{COLORS[6].text} Congratulations, you won! #{Color.reset}"
      else
        puts "#{COLORS[1].text} Sorry, you ran out of time... #{Color.reset}"
      end
    end
  end
end
