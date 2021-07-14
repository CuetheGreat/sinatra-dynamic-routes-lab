require_relative 'config/environment'

class App < Sinatra::Base
  # Write your code here!

  get '/reversename/:name' do
    params[:name].reverse
  end

  get '/square/:number' do
    number = params[:number].to_i
    "#{number * number}"
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    array = ''
    5.times do |i|
      array += params["word#{i + 1}".to_sym]

      array += ' ' if i + 1 != 5
    end

    array += '.'
  end

  get '/say/:number/:phrase' do
    @number = params[:number].to_i
    @phrase = params[:phrase]

    erb :phase
  end

  get '/:operation/:number1/:number2' do
    @number1 = params[:number1].to_i
    @number2 = params[:number2].to_i
    @operation = params[:operation]

    if @operation == 'add'
      "#{@number1 + @number2}"
    elsif @operation == 'subtract'
      "#{@number1 - @number2}"
    elsif @operation == 'multiply'
      "#{@number1 * @number2}"
    elsif @operation == 'divide'
      "#{@number1 / @number2}"
    end
  end
end
