class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :email, null: false, comment: "メールアドレス"
      t.string :password_digest, null: false, comment: "パスワード"
      t.string :name, null: false, comment: "アカウント名"

      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :name, unique: true
  end
end
