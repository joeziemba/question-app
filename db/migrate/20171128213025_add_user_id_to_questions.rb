class AddUserIdToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_reference :questions, :user, null: false, default: 1
  end
end
