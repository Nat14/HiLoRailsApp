class GameController < ApplicationController
  def try
    # this will render try.html.erb in views folder after everything in the method has been executed.
    if session[:secret_number].nil?
      session[:secret_number] = Random.rand(100)
    end


    @secret_number = session[:secret_number].to_i
    @guess = params[:guess].to_i

    if @guess < 100 && @guess > 0
      @guess = params[:guess].to_i
      if @secret_number == @guess
        @result = "You win! Guess another number to play again!"
        session[:secret_number] = Random.rand(100)
      elsif @secret_number > @guess
        @result = "Too Low, guess again!"
      elsif @secret_number < @guess
        @result = "Too High, guess again!"
      end
    else
      @result = "Please enter a NUMBER between 1 and 100!"
    end


  end

end
