class CreateSignImages < ActiveRecord::Migration[7.0]
  def change
    create_table :sign_images do |t|
      t.longtext :src

      t.timestamps
    end
  end
end
