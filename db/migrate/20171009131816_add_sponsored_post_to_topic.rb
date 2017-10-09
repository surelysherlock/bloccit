class AddSponsoredPostToTopic < ActiveRecord::Migration[5.1]
  def change
    add_column :topics, :topic_id, :integer
    add_index :topics, :topic_id
  end
end
