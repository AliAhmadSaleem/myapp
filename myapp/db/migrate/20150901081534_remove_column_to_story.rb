class RemoveColumnToStory < ActiveRecord::Migration
  def change
    remove_column :stories, :author, :string
  end
end
