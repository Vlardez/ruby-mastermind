require_relative 'code'
require 'set'

class Computer
  def initialize
    @attempt = []
    @poss_answers = Set.new
    # initialize answer set
    6.times do |i|
      6.times do |j|
        6.times do |k|
          6.times do |l|
            @poss_answers << [i+1,j+1,k+1,l+1]
          end
        end
      end
    end
  end

end
