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

code = Code.new(COLORS)

code.read
code.check([2,2,3,2])