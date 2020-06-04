class ChangeForeignKeyForDoses < ActiveRecord::Migration[6.0]
  def change
    rename_column :doses, :dose_id, :ingredients_id
  end
end
