class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :votes, as: :votable

  def all_votes
    votes.sum(:answer_value)
  end

end
