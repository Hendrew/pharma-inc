class CreateUserLocationCoordinates < ActiveRecord::Migration[6.1]
  def change
    create_table :user_location_coordinates do |t|
      t.string      :latitude,      null: false, default: ''
      t.string      :longitude,     null: false, default: ''
      t.references  :user_location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
