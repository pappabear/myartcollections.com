User.destroy_all

User.create(name: "Chip Irek", email: "chip.irek@gmail.com", password: "lollip0p", password_confirmation: "lollip0p",
            activated: true,
            activated_at: Time.zone.now)

User.create(name: "Michael Hartl", email: "mhartl@example.com", password: "foobar", password_confirmation: "foobar",
            activated: true,
            activated_at: Time.zone.now)

