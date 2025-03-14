class Task < ApplicationRecord
  belongs_to :user

  validates :description, presence: true

  scope :by_description, ->(description) {
    where("LOWER(description) LIKE ?", "%#{description.downcase}%") if description
  }

  scope :by_status, ->(status) {
    where(completed: status) unless status.nil?
  }
end
