class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string    :gender,      null: false, default: ''
      t.string    :email,       null: false, default: ''
      t.string    :phone,       null: false, default: ''
      t.string    :cell,        null: false, default: ''
      t.string    :nat,         null: false, default: ''
      t.datetime  :imported_at
      t.integer   :status,      null: false, default: 1

      t.timestamps
    end
  end
end
