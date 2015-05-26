class Dish < ActiveRecord::Base

  scope :published, -> { where(published: true) } 
  scope :search_title_and_description, ->(search_title){ where( "upper(title) LIKE ? OR upper(description) LIKE ?", "%#{search_title.upcase}%", "%#{search_title.upcase}%" ) }
end
