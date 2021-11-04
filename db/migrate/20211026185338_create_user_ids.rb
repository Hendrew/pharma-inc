class CreateUserIds < ActiveRecord::Migration[6.1]
  def change
    create_table :user_ids do |t|
      t.string      :name
      t.string      :value
      t.references  :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
