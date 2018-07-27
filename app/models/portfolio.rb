class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image

  def self.javascript
    where(subtitle: "Javascript")
  end

  scope :rubyrails, -> { where(subtitle: 'Ruby on Rails') }
end
