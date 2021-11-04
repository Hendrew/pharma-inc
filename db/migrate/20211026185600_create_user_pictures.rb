class CreateUserPictures < ActiveRecord::Migration[6.1]
  def change
    create_table :user_pictures do |t|
      t.string      :large
      t.string      :medium
      t.string      :thumbnail
      t.references  :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
