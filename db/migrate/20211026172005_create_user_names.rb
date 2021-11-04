class CreateUserNames < ActiveRecord::Migration[6.1]
  def change
    create_table :user_names do |t|
      t.string      :title
      t.string      :first
      t.string      :last
      t.references  :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
