class CreatePosttings < ActiveRecord::Migration
  def change
    create_table :posttings do |t|
      t.string :title
      t.string :content
      t.attachment :picture

      t.timestamps
    end
  end
end
