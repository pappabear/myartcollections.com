User.destroy_all

User.create(name: "Chip Irek", email: "chip.irek@gmail.com", password: "lollip0p", password_confirmation: "lollip0p",
            activated: true,
            activated_at: Time.zone.now)

User.create(name: "Michael Hartl", email: "mhartl@example.com", password: "foobar", password_confirmation: "foobar",
            activated: true,
            activated_at: Time.zone.now)


Collection.create!(user_id: User.first.id, name: "Nano Lopez", description: Faker::Lorem.sentence)
Collection.create!(user_id: User.first.id, name: "Marcus Glen's Emotion Series", description: Faker::Lorem.sentence)
Collection.create!(user_id: User.first.id, name: "Lebo acrylic on glass", description: Faker::Lorem.sentence)

