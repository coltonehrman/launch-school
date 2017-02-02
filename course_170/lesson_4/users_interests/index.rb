require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'yaml'

before do
  @users = Psych.load_file('users.yaml')
end

helpers do
  def count_interests
    total = 0
    @users.each do |_, data|
      total += data[:interests].count
    end
    total
  end
end

get '/' do
  erb :users
end

get '/user/:name' do
  @user = @users[params[:name].to_sym]
  erb :user
end
