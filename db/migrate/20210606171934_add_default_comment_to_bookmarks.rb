class AddDefaultCommentToBookmarks < ActiveRecord::Migration[6.0]
  def change
    change_column :bookmarks, :comment, :string, default: ""
  end
end
