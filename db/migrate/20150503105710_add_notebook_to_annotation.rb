class AddNotebookToAnnotation < ActiveRecord::Migration
  def change
    add_reference :annotations, :notebook, index: true, foreign_key: true
  end
end
