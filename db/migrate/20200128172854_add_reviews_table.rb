class AddReviewsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :content
      t.string :author
      t.integer :rating
      t.integer :destination_id
      t.integer :user_id

      t.timestamp
    end
  end
end
