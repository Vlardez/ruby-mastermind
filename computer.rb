require_relative 'code'
require_relative 'color'


class Computer
  attr_reader :matches, :partials, :num_turns
  attr_writer :code

  def initialize(code)
    @attempt = [1, 1, 2, 2]
    @code = code
    @matches = 0
    @partials = 0
    @score = [@matches, @partials]
    @num_turns = 1
    @poss_answers = []
    # initialize answer set
    6.times do |i|
      6.times do |j|
        6.times do |k|
          6.times do |l|
            @poss_answers << [i + 1, j + 1, k + 1, l + 1]
          end
        end
      end
    end
  end

  def try
    loop do
      puts "Trying #{@attempt} for turn number #{num_turns}"
      check(@code)
      update_score
      check_answers
      @num_turns += 1
      return @num_turns if @score == [4, 0]
    end
  end

  private

  ## updates the current score to keep it stored
  def update_score
    @score = [@matches, @partials]
  end

  ## attempts the code and receives a score
  def check(code)
    hits, remaining = code.zip(@attempt).partition { |a, b| a == b }
    @matches = hits.size
    guess, remaining = remaining.transpose
    @partials = 0
    if guess
      guess.each do |c|
        if remaining.include?(c)
          @partials += 1
          remaining.delete_at(remaining.find_index(c))
        end
      end
    end
    # this explicit return is needed to compare scores
    [@matches, @partials]
  end

  ## blasts the possible answers and deletes any that would not provide the same score response
  def check_answers
    @poss_answers.delete(@attempt)
    @poss_answers.each { |guess| @poss_answers.delete(guess) unless check(guess) == @score }
    @attempt = @poss_answers.sample
  end
end