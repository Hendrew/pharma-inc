class CreateUserNames < ActiveRecord::Migration[6.1]
  def change
    create_table :user_names do |t|
      t.string      :title,   null: false, default: ''
      t.string      :first,   null: false, default: ''
      t.string      :last,    null: false, default: ''
      t.references  :user,    null: false, foreign_key: true

      t.timestamps
    end
  end
end
