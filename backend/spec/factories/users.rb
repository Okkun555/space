# == Schema Information
#
# Table name: users
#
#  id                          :bigint           not null, primary key
#  email(メールアドレス)       :string           not null
#  name(アカウント名)          :string           not null
#  password_digest(パスワード) :string           not null
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#  index_users_on_name   (name) UNIQUE
#
FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user_#{n}@example.com" }
    password { "password123" }
    sequence(:name) { |n| "user_#{n}" }
  end
end
