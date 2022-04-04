class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :username
      t.text :description
      t.belongs_to :user, null: false, foreign_key: true
      t.string :location
      t.decimal :latitude
      t.decimal :longitude
      t.string :country_code
      t.string :slug
      t.string :profile_picture
      t.string :cover_picture

      t.timestamps
    end
  end
end
