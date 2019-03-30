class CreateDiscussGroupRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :discuss_group_relationships do |t|
      t.references :discuss_group, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
