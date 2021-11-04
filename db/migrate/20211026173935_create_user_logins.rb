class CreateUserLogins < ActiveRecord::Migration[6.1]
  def change
    create_table :user_logins do |t|
      t.string      :uuid
      t.string      :username
      t.string      :password
      t.string      :salt
      t.string      :md5
      t.string      :sha1
      t.string      :sha256
      t.references  :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
