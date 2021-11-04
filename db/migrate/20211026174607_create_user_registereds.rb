class CreateUserRegistereds < ActiveRecord::Migration[6.1]
  def change
    create_table :user_registereds do |t|
      t.string      :date
      t.integer     :age
      t.references  :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
