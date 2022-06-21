class ChangeDataImageIdToPosts < ActiveRecord::Migration[5.0]
  def change
  change_column :posts, :image_id, :string
  end
end
