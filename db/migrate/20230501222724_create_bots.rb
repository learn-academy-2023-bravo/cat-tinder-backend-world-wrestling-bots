class CreateBots < ActiveRecord::Migration[7.0]
  def change
    create_table :bots do |t|
      t.string :name
      t.integer :age
      t.integer :weight
      t.text :enjoys
      t.text :image

      t.timestamps
    end
  end
end
