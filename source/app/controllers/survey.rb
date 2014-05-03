require "json"

get "/surveys" do
  @surveys = Survey.all
  erb :surveys
end

get "/take_survey/:id" do
  @survey = Survey.find(params[:id])
  erb :survey
end

post '/save_answers/:id' do
  @survey = Survey.find(params[:id])
  @user_id = session[:user_id]
  @user = User.find(@user_id)
  answers = params.values.take(@survey.questions.length)
  @survey.questions.each do |question|
    question.answers << Answer.create(:answer => answers.shift, :user => @user)
  end
  redirect "/survey/results/#{@survey.id}"
end

get "/survey/results/:id" do
  @survey = Survey.find(params[:id])
  erb :survey_result
end

get "/create_survey" do
  erb :create_survey
end

post "/create_survey" do
  # params from form should be { title: "Title", question1: "Q1", question2: "Q2", question3: "Q3", etc. }
  survey = Survey.create(name: params[:name], user: User.find(session[:user_id]))
  params.shift

  params.values.each do |q|
    survey.questions << Question.create(question: q )
  end
  @survey_id = survey.id
  redirect "/surveys"
end
