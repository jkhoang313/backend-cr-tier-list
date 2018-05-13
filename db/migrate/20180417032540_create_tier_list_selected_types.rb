class CreateTierListSelectedTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :tier_list_selected_types do |t|
      t.references :tier_list, index: true
      t.references :tier_list_type, index: true

      t.timestamps
    end
  end
end
