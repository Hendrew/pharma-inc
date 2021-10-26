class CreateUserLogins < ActiveRecord::Migration[6.1]
  def change
    create_table :user_logins do |t|
      t.string      :uuid,      null: false, default: ''
      t.string      :username,  null: false, default: ''
      t.string      :password,  null: false, default: ''
      t.string      :salt,      null: false, default: ''
      t.string      :md5,       null: false, default: ''
      t.string      :sha1,      null: false, default: ''
      t.string      :sha256,    null: false, default: ''
      t.references  :user,      null: false, foreign_key: true

      t.timestamps
    end
  end
end
