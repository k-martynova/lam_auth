class CreateUserFromLamData
  def self.call(data)
    if uid = (data || {})['id']
      user = User.find_or_initialize_by(uid: uid)
      user.email = data['email']
      user.save
      user
    end
  end
end
