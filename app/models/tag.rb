class Tag < ApplicationRecord
  TAG_REGEX = /(?<=\B#)[[:alnum:]_]+/

  has_many :question_tags, dependent: :destroy
  has_many :questions, through: :question_tags

  default_scope { order(name: :asc) }
  # scope :with_questions, -> { joins(:questions).distinct }

  before_validation { name&.downcase! }

  validates :name, presence: true
end
