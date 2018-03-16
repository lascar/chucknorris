class CreateChucks < ActiveRecord::Migration[5.1]
  def change
    create_table :chucks do |t|
      t.string :chuck_id
      t.string :value
      t.string :category
      t.timestamps
    end
  end
end
