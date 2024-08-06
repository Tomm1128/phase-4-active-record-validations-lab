class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: {minimum: 250 }
  validates :summary, length: {maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait?

  def clickbait?
    return if title.nil?

    clickbait_phrases =[
      "Won't Believe",
      "Secret",
      /Top \d+/,
      "Guess"
    ]

    unless clickbait_phrases.any? do |phrase|
      if phrase.is_a?(String)
        title.include?(phrase)
      elsif phrase.is_a?(Regexp)
        title.match?(phrase)
      end
    end
      errors.add(:title, "Not clickbaity enough")
    end
  end
end
