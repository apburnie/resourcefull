class AddItemIdToRequests < ActiveRecord::Migration
  def change
    add_reference :requests, :item, index: true, foreign_key: true
  end
end
