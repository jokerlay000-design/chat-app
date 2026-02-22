class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user

  has_one_attached :image

  validate :content_or_image

  private

  def content_or_image
    if content.blank? && !image.attached?
      errors.add(:content, "can't be blank")
    end
  end
end