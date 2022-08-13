class JobApplication < ApplicationRecord
  belongs_to :job
  belongs_to :user
  enum status: { applied: 0, reviewed: 1, rejected: 2, withdrawn: 3 }
end
