class AddReferenceToDishesInFan < ActiveRecord::Migration
  def change
    add_reference :dishes, :fan, index: true
  end
end
