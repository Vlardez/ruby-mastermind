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
  1 => 16, # black
  2 => 124, # red
  3 => 28, # green
  4 => 142, # yellow
  5 => 21, # blue
  6 => 99, # magenta
  7 => 45, # cyan
  8 => 7 # white
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
  exit if input == 2

  #  codebreaker mode
  if input == 1
    code = Code.new(COLORS)
    turns = 0

    until turns >= 12
      puts "you have #{12 - turns} turns left"
      Display.color_reference
      turns = code.check(Display.player_guess) ? 20 : turns+1
    end

    Display.result(turns)
    code.read
    input = Display.prompt('Would you like to play again? Y/N') until ['Y', 'N'].include?(input)
  end
end