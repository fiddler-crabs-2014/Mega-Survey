  def average_result(question_id)
    Answer.group("question_id").average(:answer)[question_id]
  end

  def answer_to_text(answer_num, count)
    singular_responses = ["they really don't like it", "it's just okay", "they're indifferent", "thinks it's good", "they love it!!"]
    plural_responses = ["they really don't like it", "it's just okay", "they're indifferent", "they think it's good", "they love it!!"]
    if count ==1
      return singular_responses[answer_num-1]
    else
      return plural_responses[answer_num-1]
    end
  end


  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end
