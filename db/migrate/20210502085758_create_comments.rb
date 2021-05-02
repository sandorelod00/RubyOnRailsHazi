class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :createdByUserId
      t.integer :toUserId
      t.integer :rootCommentId
      t.text :content

      t.timestamps
    end
  end
end
