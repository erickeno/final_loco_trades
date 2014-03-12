class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :image
      t.references :post, index: true

      t.timestamps
    end
  end
end
