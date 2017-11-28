class Answer < ApplicationRecord
  belongs_to :question

  validates :body,
    length: {minimum: 50}
end
