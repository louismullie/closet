# Global variables.
before do
  @title = 'Closet'
  @user = session[:user]
  I18n.locale = params[:locale] || I18n.default_locale
end