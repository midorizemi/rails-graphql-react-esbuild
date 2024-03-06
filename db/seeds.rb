# ユーザーの生成

super_user = User.create!(
  email: 'test@test',
  password: 'password',
  password_confirmation: 'password',
  full_name: 'スーパーユーザー'
)

5.times do |i|
  User.create!(
    email: "test#{i + 1}@test.com",
    password: 'password',
    password_confirmation: 'password',
    full_name: "テストユーザー#{i + 1}"
  )
end

# プロジェクトの生成
15.times do |i|
  project = Project.create!(
    name: "プロジェクト#{i + 1}",
    owner_id: User.all.sample.id
  )

  # メンバーの追加 (オーナーとは別のランダムなユーザーを2名追加)
  members = User.where.not(id: project.owner_id).sample(2)
  members.each do |member|
    ProjectMember.create!(
      project:,
      user: member
    )
  end
end

# タスクの生成
Project.all.each do |project|
  3.times do |i|
    Task.create!(
      title: "タスク#{i + 1}",
      project:
    )
  end
end
