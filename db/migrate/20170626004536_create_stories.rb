class CreateStories < ActiveRecord::Migration[5.1]
  def change
    create_table :stories do |t|
      t.string :title
      t.string :summary
      t.string :icon
      t.integer :status
      t.references :user, foreign_key: true

      t.timestamps
    end

    add_column :chapters, :story_id, :integer
    add_column :chapters, :number, :integer
    add_foreign_key :chapters, :stories, index: true
  end
end
