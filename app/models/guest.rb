class Guest
  def persisted?
    false
  end

  def watching?(movie)
    false
  end

  User::ROLES.each do |role_name|
    define_method "#{role_name}?" do
      false
    end
  end
end
