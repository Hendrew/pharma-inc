class CreateUserLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :user_locations do |t|
      t.string      :street,    null: false, default: ''
      t.string      :city,      null: false, default: ''
      t.string      :state,     null: false, default: ''
      t.string      :postcode,  null: false, default: ''
      t.references  :user,      null: false, foreign_key: true

      t.timestamps
    end
  end
end
