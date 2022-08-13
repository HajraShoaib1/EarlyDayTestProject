class Job < ApplicationRecord
  extend FriendlyId

  has_many :job_applications, dependent: :destroy
  friendly_id :title, use: :slugged
  validates :slug, uniqueness: true, presence: true
  validates :status, presence: true
  enum status: { open: 0, closed: 1, draft: 2 }
end
