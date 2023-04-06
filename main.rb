# keep main minimal
## player
## code
### generate code
### store code from player
### check code against guesses

## display
### display colors
### provide prompts
require_relative 'color'
require_relative 'display'
require_relative 'code'

# color setup
COLOR_CODES = {
  1 => 124, # red
  2 => 28, # green
  3 => 142, # yellow
  4 => 21, # blue
  5 => 99, # magenta
  6 => 45 # cyan
}
COLORS = COLOR_CODES.map {|name, code| Color.new(name, code)}

puts '#############################'
puts '### WELCOME TO MASTERMIND ###'
puts "############################# \n"

input = ''
until input == 'N'
  until [1, 2].include?(input)
    puts 'Please select whether you would like to be the code-breaker(1) or the code-maker(2) - not yet implemented.'
    input = gets.strip.to_i
  end

  #  codebreaker mode
  if input == 1
    code = Code.new(COLORS)
    turns = 0
    puts 'Please try to guess the code. Enter in four single digits corresponding to the above color legend.'
    until turns >= 12
      puts "you have #{12 - turns} turns left"
      Display.color_reference
      turns = code.check(Display.player_guess) ? 20 : turns+1
    end
    Display.result(turns)
    code.read
    input = Display.end_prompt until ['Y', 'N'].include?(input)
  end

  # codemaker mode
  if input == 2
    Display.color_reference
    while 1 == 1 
      code = Display.code_prompt
      break if code.length == 4 && !code.include?(0)
      puts 'Please ensure your code is only 4 nonzero digits. Any zeroes or other characters are not permitted.'
    end
  end
  input = Display.end_prompt until ['Y', 'N'].include?(input)
end
Display.exit_message
