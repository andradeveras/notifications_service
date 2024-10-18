class CreateNotifications < ActiveRecord::Migration[7.1]
  def change
    create_table :notifications do |t|
      t.string :task_title
      t.string :task_status
      t.string :task_url
      t.string :user_email

      t.timestamps
    end
  end
end
