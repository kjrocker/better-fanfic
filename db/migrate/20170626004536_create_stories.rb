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

    add_foreign_key :chapters, :stories, index: true
  end
end
