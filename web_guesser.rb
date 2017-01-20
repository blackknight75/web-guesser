require 'sinatra'
require 'sinatra/reloader'
require 'pry'

secret_number = (rand(100) + 1)

get '/' do
  erb :index, :locals => {:number => secret_number, :comparison_message => message(params['guess'], secret_number)}
end


def message(player_guess, secret_number)
  secret = secret_number
  guess  = player_guess.to_i
return high(secret, guess)        if guess> secret && guess != 38
return low(secret, guess)         if guess < secret && guess != 38
return "You got it right!" if guess == secret
end

def high(secret, guess)
  if secret - guess < (-5)
    "Way too High!"
  else
    "Too High!"
  end
end

def low(secret, guess)
  if (secret - guess) > 5
    "Way too Low!"
  else
    "Too Low!"
  end
end
