class RemoveUsrIdFromFavorites < ActiveRecord::Migration[6.1]
  def change
    remove_column :favorites, :usr_id, :integer
  end
end
