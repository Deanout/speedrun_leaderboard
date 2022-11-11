class CreateSpeedruns < ActiveRecord::Migration[7.0]
  def change
    create_table :speedruns do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :category, null: false, foreign_key: true
      t.integer :time

      t.timestamps
    end
  end
end
