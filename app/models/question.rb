class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true

  has_many :question_tags, dependent: :destroy
  has_many :tags, through: :question_tags

  validates :text, presence: true,
                   length: { maximum: 255 }

  after_commit :update_tags, on: %i[create update]

  private

  def update_tags
    self.tags =
      "#{text} #{answer}".downcase.scan(Tag::TAG_REGEX).uniq.map do |tag|
        Tag.find_or_create_by(name: tag)
      end
  end
end
