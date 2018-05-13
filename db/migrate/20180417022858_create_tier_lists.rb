class CreateTierLists < ActiveRecord::Migration[5.0]
  def change
    create_table :tier_lists do |t|
      t.references :user, index: true
      t.string :title
      t.text :description
      t.integer :upvotes, default: 0, index: true
      t.jsonb :tiers, default: []
      t.references :primary_list_type, references: :tier_list_types, index: true

      t.timestamps
    end
  end
end
