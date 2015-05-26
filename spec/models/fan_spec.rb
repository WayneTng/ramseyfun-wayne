require 'rails_helper'

RSpec.describe Fan, type: :model do
  context 'Association' do
    it{ should have_many(:dishes) }
  end
end
