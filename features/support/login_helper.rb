module LoginHelper
  def login(email = 'john.doe@example.com', password = 'password')
    @current_user = create :user, email: email, password: password

    visit '/sign_in'

    fill_in 'session[email]', with: email
    fill_in 'session[password]', with: password

    click_button 'Sign in'
  end

  alias :login_as :login

  def current_user
    @current_user
  end
end

World(LoginHelper)
