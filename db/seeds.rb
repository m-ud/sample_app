# メインのサンプルユーザーを1人作成する
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

# 追加のユーザーをまとめて生成する
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

# ユーザーの一部を対象にマイクロポストを生成する
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.microposts.create!(content: content) }
end

#以下のリレーションシップを作成する
users   = User.all          #usersは全ユーザー
user    = users.first       #userはユーザー1
following = users[2..50]    #ユーザー1がユーザー3~51をフォローするための集合
followers = users[3..40]    #ユーザー4~41がユーザー1をフォローするための集合
following.each { |followed| user.follow(followed) } #ユーザー1がfollowingのリストにあるユーザーをフォローする
followers.each { |follower| follower.follow(user) } #followersのリストにあるユーザーがユーザー1をフォローする