user = User.create(
  {email: "jdoe@example.com", dateofbirth: "1991-04-10", firstname: "John", lastname: "Doe", password: "johndoe91"}
)
user.signature.attach(io: File.open('johndoe.png'),
filename: "johndoe.png", content_type: "image/png")