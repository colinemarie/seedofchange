class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.boolean :read, default: false

      t.timestamps
    end
  end
end
