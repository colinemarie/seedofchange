class AddArraysToChallenges < ActiveRecord::Migration[6.0]
  def change
    change_column :challenges, :necessary_items, :text, array: true, default: [], using: "(string_to_array(necessary_items, ','))"
    change_column :challenges, :where_to, :text, array: true, default: [], using: "(string_to_array(where_to, ','))"
    change_column :challenges, :how_to, :text, array: true, default: [], using: "(string_to_array(how_to, ','))"
  end
end
