class CreateContentItems < ActiveRecord::Migration[6.1]
  def change
    create_table :content_items do |t|
      t.string :content_title
      t.string :publishing_target
      t.datetime :publish_date
      t.datetime :start_time
      t.datetime :end_time
      t.timestamps
    end
  end
end
