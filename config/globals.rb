# Runs before everything.
before do
  # Setup global shortcuts.
  @title  = 'Closet'
  @user   = session[:user]

  # Setup I18N locale.
  locale  = params[:locale]
  default = I18n.default_locale
  I18n.locale = locale || default
end