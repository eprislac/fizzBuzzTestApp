class WelcomeController < ApplicationController
  def index

  end

  def is_integer?(string)
    true if Integer(string) rescue false
  end
  def get_fizzbuzz
    @word = ""
    if is_integer?(params[:number])
      @number = params[:number].to_i
      if (@number % 3 == 0) && (@number % 5 == 0)
        @word = "FizzBuzz"
      else
        if @number % 3 == 0
          @word = "Fizz"
        elsif @number % 5 == 0
          @word = "Buzz"
        else
          @word = ""
        end
      end
    else
      @word = "Not Found"
    end

    @response = {
        word: @word
    }
    respond_to do |format|
      if @word == "Not Found"
        format.html { render "/404.html", status:404 }
        format.json { render json: {error: "not-found"}.to_json, status: 404 }
      else
        format.html
        format.json { render json: @response }
      end

    end
  end

end