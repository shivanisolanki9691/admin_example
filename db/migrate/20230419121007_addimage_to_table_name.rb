class AddimageToTableName < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :image, :binary
  end
end

