phil = User.create(:username => "Phil", :password => "Password")
shaun = User.create(:username => "Shaun", :password => "test")

food_survey = Survey.create(:name => "Favorite Foods")

phil.surveys << food_survey

questions = [
Question.create(:question => "How much do you like spaghetti?"),
Question.create(:question => "How much do you like lemons?"),
Question.create(:question => "How much do you like pizza?"),
Question.create(:question => "How much do you like cherry pie?"),
Question.create(:question => "How much do you like milkshakes?")]

questions.each do |question|
  question.answers << Answer.create(user: shaun, :answer => (1..5).to_a.sample)
end

questions.each do |question|
  food_survey.questions << question
end

