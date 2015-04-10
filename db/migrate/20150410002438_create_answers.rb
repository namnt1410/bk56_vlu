class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.belongs_to :question, index: true
      t.text :content
      t.integer :vote, :default => 0
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
