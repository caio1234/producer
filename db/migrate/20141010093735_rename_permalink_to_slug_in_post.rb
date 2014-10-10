class RenamePermalinkToSlugInPost < ActiveRecord::Migration
  def change
    rename_column :posts, :permalink, :slug
  end
end
