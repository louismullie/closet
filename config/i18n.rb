require 'i18n'

file = File.dirname(__FILE__)
path = [file, 'config', 'locales', '*.yml']
config = File.join(*path)

I18n.load_path += Dir[config]
I18n.default_locale = :en