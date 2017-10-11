class FixSpTable < ActiveRecord::Migration[5.1]
  def change
    remove_column :sponsored_posts, :Topic_id
    add_column :sponsored_posts, :topic_id, :integer
  end
end
