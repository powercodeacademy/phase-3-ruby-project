class AddColumnDescriptionToDeck < ActiveRecord::Migration[8.0]
  def change
    add_column :decks, :description, :text
  end
end
