class AddAnswerValueColumnToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :answer_value, :integer
  end
end
