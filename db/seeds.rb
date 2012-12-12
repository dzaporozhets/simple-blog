admin = User.create(
  email: "admin@local.host",
  password: "111111",
  password_confirmation: "111111"
)

admin.confirm!

if Rails.env == 'development'
  20.times do |i|
    admin.posts.create(
      title: 'Lorem ipsum dolor sit amet',
      slug: 'lorem-ipsum',
      preview: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam molestie, tortor mollis sagittis tempor, mauris nisi fringilla mi, at condimentum enim velit lacinia erat.',
      published: true
    )
  end
end
