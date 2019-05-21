module SessionHelpers
  def log_in_as(user)
    visit login_path
    fill_in name: 'session[email]', with: user.email
    fill_in name: 'session[password]', with: user.password
    click_button 'ログインする'
  end

  def log_out
    visit root_path
    click_link 'ログアウト'
  end
end