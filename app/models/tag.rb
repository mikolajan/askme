class Tag < ApplicationRecord
  TAG_REGEX = /#[\wа-яё]+/

  has_many :question_tags
  has_many :questions, through: :question_tags

  scope :with_questions, -> { joins(:questions).distinct }

  before_validation { name&.downcase! }

  validates :name, presence: true

  def to_param
    name
  end
end
