class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.string :name
      t.integer :card_type
      t.integer :rarity
      t.integer :elixir_cost
      t.integer :arena

      t.timestamps
    end
  end
end
