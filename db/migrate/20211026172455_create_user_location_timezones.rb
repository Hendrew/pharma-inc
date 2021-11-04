class CreateUserLocationTimezones < ActiveRecord::Migration[6.1]
  def change
    create_table :user_location_timezones do |t|
      t.string      :offset
      t.string      :description
      t.references  :user_location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
