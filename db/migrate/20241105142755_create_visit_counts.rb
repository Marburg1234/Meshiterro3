class CreateVisitCounts < ActiveRecord::Migration[6.1]
  def change
    create_table :visit_counts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post_image, null: false, foreign_key: true

      t.timestamps
    end
  end
end
