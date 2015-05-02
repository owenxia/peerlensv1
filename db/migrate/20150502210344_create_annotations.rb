class CreateAnnotations < ActiveRecord::Migration
  def change
    create_table :annotations do |t|
      t.text :quote
      t.text :note

      t.timestamps null: false
    end
  end
end
