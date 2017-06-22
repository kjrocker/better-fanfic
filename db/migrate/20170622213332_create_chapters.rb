class CreateChapters < ActiveRecord::Migration[5.1]
  def change
    create_table :chapters do |t|
      t.string :title
      t.text :raw_text
      t.text :safe_text
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
