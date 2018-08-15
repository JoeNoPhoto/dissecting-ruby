class Portfolio < ApplicationRecord
  has_many :technologies
  accepts_nested_attributes_for :technologies,
                                reject_if: lambda { |attrs| attrs['name'].blank? }

  validates_presence_of :title, :body

  mount_uploader :main_image, PortfolioUploader
  mount_uploader :thumb_image, PortfolioUploader

  def self.javascript
    where(subtitle: 'Javascript')
  end

  def self.by_position
    order('position ASC')
  end

  scope :rubyrails, -> { where(subtitle: 'Ruby on Rails') }
end
