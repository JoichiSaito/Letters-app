class Board < ApplicationRecord
  validates :title, presence: true, length: { maximum: 30 }
  validates :content, presence: true, length: { maximum: 500 }
  validates :user_id, presence: true

  has_many :joins, dependent: :destroy
  belongs_to :user

  def joined_by?(user)
    joins.where(user_id: user.id).present?
  end
end
