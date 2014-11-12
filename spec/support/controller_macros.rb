module ControllerMacros
  def sign_in_user
    user = double "User", persisted?: true, id: 1, admin?: false
    allow_message_expectations_on_nil
    allow(request.env['warden']).to receive(:authenticate!).and_return user
    allow(controller).to receive(:current_user).and_return user

    user
  end

  def sign_in_admin
    user = double "User", persisted?: true, id: 1, admin?: true
    allow_message_expectations_on_nil
    allow(request.env['warden']).to receive(:authenticate!).and_return user
    allow(controller).to receive(:current_user).and_return user

    user
  end
end
