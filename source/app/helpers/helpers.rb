  def average_result(question_id)
    Answer.group("question_id").average(:answer)[question_id]
  end
