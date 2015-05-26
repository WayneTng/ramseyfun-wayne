require 'rails_helper'

RSpec.describe Dish, type: :model do
  
  context 'Validation' do
    it{ should validate_presence_of(:title) }
    it{ should validate_presence_of(:description) }
  end

  context 'Association' do
    it{ should belong_to (:fan) }
  end
end
