def take_survey(survey)
  survey.questions.each do |question|
    question.answers << Answer.create(:answer => rand(1..5))
  end
end

phil = User.create(:username => "Phil", :password => "Password")
shaun = User.create(:username => "Shaun", :password => "test123")

food_survey = Survey.create(:name => "Favorite Foods")

phil.surveys << food_survey

questions = [
Question.create(:question => "How much do you like spaghetti?"),
Question.create(:question => "How much do you like lemons?"),
Question.create(:question => "How much do you like pizza?"),
Question.create(:question => "How much do you like cherry pie?"),
Question.create(:question => "How much do you like milkshakes?")]


questions.each do |question|
  food_survey.questions << question
end

100.times do
  take_survey(Survey.find(1))
end

