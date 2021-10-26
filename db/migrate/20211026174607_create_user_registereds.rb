class CreateUserRegistereds < ActiveRecord::Migration[6.1]
  def change
    create_table :user_registereds do |t|
      t.string      :date,  null: false, default: ''
      t.integer     :age,   null: false, default: ''
      t.references  :user,  null: false, foreign_key: true

      t.timestamps
    end
  end
end
