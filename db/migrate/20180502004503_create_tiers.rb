class CreateTiers < ActiveRecord::Migration[5.0]
  def change
    create_table :tiers do |t|
      t.references :tier_list
      t.string :name
      t.text :description
      t.text :notes
      t.integer :position
      t.jsonb :cards, default: []

      t.timestamps
    end
  end
end
