class Dish < ActiveRecord::Base

  scope :published, -> { where(published: true) } 
  scope :search_title_and_description, ->(search_title, search_description){ where( "title LIKE ? OR description LIKE ?", "%#{search_title}%", "%#{search_description}%" ) }
end
