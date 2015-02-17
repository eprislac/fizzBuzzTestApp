class WelcomeController < ApplicationController
  def index

  end

  def get_fizzbuzz
    @number = params[:number]
    @word = ""
    if @number % 3 == 0
      @word = "Fizz"
    elsif @number % 5 == 0
      @word = "Buzz"
    elsif (@number % 3 == 0) && (@number % 5 == 0)
      @word = "FizzBuzz"
    end
    @response = {
        word: @word
    }
    respond_to do |format|
      format.json { render json: @response }
    end
  end
end