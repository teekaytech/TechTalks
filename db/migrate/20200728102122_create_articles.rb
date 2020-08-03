# frozen_string_literal: true

class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.references :author, null: false, index: true
      t.string :title
      t.text :text
      t.string :image

      t.timestamps
    end
    add_foreign_key :articles, :users, column: :author_id
  end
end
