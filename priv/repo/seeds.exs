alias Pantry.Users
alias Pantry.Orgs

Users.create_user(%{name: "Admin", email: "admin@x.com", password: "098098", password_confirmation: "098098", avatar: "/images/icon-pantry.png", role: "admin", mobile: "098098098", pin: 0987})
Users.create_user(%{name: "Anne", email: "a@x.com", password: "098098", password_confirmation: "098098", avatar: "/images/female1.jpg", role: "ordinary", mobile: "098098098", pin: 0987})
Users.create_user(%{name: "Linda", email: "b@x.com", password: "098098", password_confirmation: "098098", avatar: "/images/female2.jpg", role: "ordinary", mobile: "098098098", pin: 0987})
Users.create_user(%{name: "Mark", email: "c@x.com", password: "098098", password_confirmation: "098098", avatar: "/images/male1.jpg", role: "ordinary", mobile: "098098098", pin: 0987})

Orgs.create_hub(%{user_id: 1, name: "Barangay Araneta", address: "Araneta street, Ormoc City", latitude: 1.1231, longitude: 2.98098, avatar: "/images/araneta.jpg", mobile: "098098098", slogan: "Service to Humanity"})
Orgs.create_hub(%{user_id: 1, name: "Barangay Luneta", address: "Luneta street, Ormoc City", latitude: 1.1231, longitude: 2.98098, avatar: "/images/luneta.jpg", mobile: "098098098", slogan: "Service to Humanity"})
Orgs.create_hub(%{user_id: 1, name: "Barangay Lucena", address: "Lucena street, Ormoc City", latitude: 1.1231, longitude: 2.98098, avatar: "/images/lucena.jpg", mobile: "098098098", slogan: "Service to Humanity"})
