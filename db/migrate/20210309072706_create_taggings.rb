class CreateTaggings < ActiveRecord::Migration[6.1]
  def change
    create_table :taggings do |t|
      t.belongs_to :album
      t.belongs_to :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
