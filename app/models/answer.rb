class Answer < ActiveRecord::Base
  validates :question_id, presence: true
  # validates :user_id, presence: true
  validates :description, presence: true, length: { maximum: 200 }
    
  belongs_to :question
  belongs_to :user

end
