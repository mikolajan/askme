class Tag < ApplicationRecord
  TAG_REGEX = /(?<=\B#)[[:alnum:]_]+/

  has_many :question_tags, dependent: :destroy
  has_many :questions, through: :question_tags

  scope :by_name, -> { order(:name) }
  scope :with_questions, -> { joins(:questions).distinct }

  before_validation { name&.downcase! }

  validates :name, presence: true
end
