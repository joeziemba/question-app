class Question < ApplicationRecord
  belongs_to :user
  has_many :answers

  validates :title,
    presence: true
    # length: {minimum: 20}

  validates :description,
    presence: true
    # length: {minimum: 50}
end
