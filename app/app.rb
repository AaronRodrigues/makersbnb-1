require "sinatra/base"
require_relative "./models/user.rb"

class Makersbnb < Sinatra::Base
  enable :sessions

  get "/signup" do
    erb :signup
  end

  post "/users/new" do
    User.create(name: params[:name], username: params[:username], email: params[:email])
    erb :signup
    redirect to "/home"
  end

  get "/home" do
    @user = User.first
    erb :home
  end

  get "/spaces/new" do
    erb :new_space
  end

  post "/spaces/new" do
    session[:new_space] = params[:new_space]
    redirect "/spaces"
  end

  get "/spaces" do
    @new_space = session[:new_space]
    erb :index
  end

  run! if app_file == $0
end
