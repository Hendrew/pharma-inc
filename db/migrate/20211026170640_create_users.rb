class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string    :gender
      t.string    :email
      t.string    :phone
      t.string    :cell
      t.string    :nat
      t.datetime  :imported_at
      t.integer   :status, null: false, default: 1

      t.timestamps
    end
  end
end
