class CreateMessages < ActiveRecord::Migration[6.1]
  def change 
    create_table :messages do |t|
      t.string :text_massage
      t.string :sender
      t.string :receiver
      t.string :type
    end
  end
end
