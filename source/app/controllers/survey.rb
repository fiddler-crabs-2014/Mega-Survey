require "json"

get "/surveys" do
  @surveys = Survey.all
  erb :surveys
end

get "/take_survey/:id" do
  @survey = Survey.find(params[:id])
  erb :survey
end

get "/survery/results/:id" do
  @survey = Survey.find(params[:id])
  erb :survey_result
end

get "/create_survey" do
  erb :create_survey
end

post "/create_survey" do
  # params from form should be { title: "Title", question1: "Q1", question2: "Q2", question3: "Q3", etc. }
  input = JSON.parse(params).values
  survey = Survey.create(title: input.shift)
  input.each do |q|
    survey.questions << Question.create(question: q )
  end
  @survey_id = survey.id
  redirect "/surveys"
end

