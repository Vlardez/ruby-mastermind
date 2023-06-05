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
require_relative 'computer'



puts '#############################'
puts '### WELCOME TO MASTERMIND ###'
puts "############################# \n"

invalid_nums = [7, 8, 9, 0]
input = ''
until input == 'N'
  until [1, 2].include?(input)
    puts 'Please select whether you would like to be the code-breaker(1) or the code-maker(2)'
    input = gets.strip.to_i
  end

  #  codebreaker mode
  if input == 1
    code = Code.new(COLORS)
    turns = 0
    puts 'Please try to guess the code. Enter in four single digits corresponding to the below color legend.'
    until turns >= 12
      puts "you have #{12 - turns} turns left"
      Display.color_reference
      ## need to errorcatch until 4 digits
      loop do
        input = Display.player_guess
        break if input.length == 4 &&(code & invalid_nums).none?

        puts 'Please ensure your code is only 4 nonzero digits. Any zeroes or other characters are not permitted.'
      end
      result = code.check(input)
      turns = result == [4,0] ? 20 : turns+1
    end
    Display.result(turns)
    code.read
    input = Display.end_prompt until ['Y', 'N'].include?(input)
  end

  # codemaker mode
  if input == 2
    Display.color_reference
    loop do
      code = Display.code_prompt
      break if code.length == 4 && (code & invalid_nums).none? ## make sure to not include 7,8,9 either.

      puts 'Please ensure your code is only 4 nonzero digits. Any zeroes or other characters are not permitted.'
    end
    solver = Computer.new(code)
    if solver.try <= 13
      puts 'Looks like the computer cracked your code! Maybe you\'ll have better luck next time ;)'
    else
      puts 'The computer couldn\'t crack the code! Don\'t know how you did it, but you beat them, congrats!!'
    end
    input = Display.end_prompt until ['Y', 'N'].include?(input)
  end
end
Display.exit_message
