class ChangeAnswersTableAnswerToI < ActiveRecord::Migration
  def change
    change_table :answers do |t|
      t.remove :answer
      t.integer :answer
    end
  end
end
