class CreateWordRanks < ActiveRecord::Migration
  def change
    create_table :word_ranks do |t|
      t.integer :post_id
      t.string :word
      t.integer :rank

      t.timestamps null: false
    end
  end
end
