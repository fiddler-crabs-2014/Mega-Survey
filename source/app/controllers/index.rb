get '/' do
  # Look in app/views/index.erb
  if session[:user_id]
    @surveys = Survey.all
    erb :surveys
  else
    erb :index
  end
end
