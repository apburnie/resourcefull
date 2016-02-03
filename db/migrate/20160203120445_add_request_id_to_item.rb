class AddRequestIdToItem < ActiveRecord::Migration
  def change
    add_reference :items, :item, index: true, foreign_key: true
  end
end
