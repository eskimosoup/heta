class Company < ActiveRecord::Base

  mount_uploader :image, CompanyUploader
  validates :name, :content, presence: true

  has_many :apprentices

  scope :by_letter, lambda { |letter| where("companies.name LIKE ? AND display = ?", "#{letter}%", true) }
end
