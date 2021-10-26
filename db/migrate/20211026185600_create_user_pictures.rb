class CreateUserPictures < ActiveRecord::Migration[6.1]
  def change
    create_table :user_pictures do |t|
      t.string      :large,     null: false, default: ''
      t.string      :medium,    null: false, default: ''
      t.string      :thumbnail, null: false, default: ''
      t.references  :user,      null: false, foreign_key: true

      t.timestamps
    end
  end
end
