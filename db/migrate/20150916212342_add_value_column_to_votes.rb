class AddValueColumnToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :question_value, :integer
  end
end
