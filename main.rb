# General outline pseudocode / brainstorm

# keep main minimal

# class division
## player?
## code
## display
## colors?

## player
### get/clean input/guesses

## code
### generate code
### store code from player
### check code against guesses

## display
### display colors
### provide prompts

## colors
### store colors
### randomly select colors from list

require_relative 'colors'
require_relative 'display'
require_relative 'code'

# color setup
COLOR_CODES = {
  'BLACK' => 16,
  'RED' => 124,
  'GREEN' => 28,
  'YELLOW' => 142,
  'BLUE' => 21,
  'MAGENTA' => 99,
  'CYAN' => 45,
  'WHITE' => 7
}
COLORS = []
COLOR_CODES.each do |name, code|
  COLORS << Color.new(name, code)
end

code = Code.new(COLORS)

code.read