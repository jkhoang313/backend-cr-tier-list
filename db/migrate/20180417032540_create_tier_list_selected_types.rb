class CreateTierListSelectedTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :tier_list_selected_types do |t|
      t.references :tier_list
      t.references :tier_list_type
      
      t.timestamps
    end
  end
end
