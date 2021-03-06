class Dish < ActiveRecord::Base
  belongs_to :fan

  validates :title, :description, :fan_id, presence: true
  validates_numericality_of :cost, greater_than_or_equal_to: 0, allow_nil: true
  validates_numericality_of :pax, greater_than_or_equal_to: 0, only_integer: true, allow_nil: true

  scope :published, -> { where(published: true) } 
  scope :search_title_and_description, ->(search_title) { where( "upper(title) LIKE ? OR upper(description) LIKE ?", "%#{search_title.upcase}%", "%#{search_title.upcase}%" ) }
end
