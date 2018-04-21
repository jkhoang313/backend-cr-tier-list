class CreateTierListTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :tier_list_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
