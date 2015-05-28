require 'rails_helper'

RSpec.describe Dish, type: :model do
  
  context 'Validation' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:fan_id) }
    it { should validate_numericality_of(:cost).is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:pax).only_integer }
  end

  context 'Association' do
    it { should belong_to (:fan) }
  end
end
