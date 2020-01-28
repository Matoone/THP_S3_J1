class User
  attr_accessor :email, :age
  @@all_users = []
  def initialize(email, age)
    @email = email
    @age = age
    @@all_users.push(self)
  end

  def self.find_by_email(email)
    @@all_users.find{|user| user.email == email}
  end

  private

  def self.all
    return @@all_users
  end
end