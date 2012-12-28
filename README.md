## Closet

Is a basic Sinatra application, loaded with the following goodies:

- HAML for layouts, SASS for styling, Skeleton for base CSS.
- Out-of-the-box Omniauth authentication (Facebook, Twitter, Google).
- MongoDB integration with a default Mongoid model to store users.
- Localization of both plain text and database fields with I18N.
- Asset compilation using `sinatra-assetpack` and `uglifier`.
- Automatic code reloading with `shotgun` + `thin` for development.
- Load balancing with `foreman` + `unicorn` for production/scaling.
- Better errors support when running in development mode.
- Markdown support with CodeRay syntax highlighting.
- Testing with Capybara/RSpec and deployment with Capistrano.

### Installing

**Download and install dependencies**

Clone the files to your computer and install gem dependencies:

    git clone git://github.com/louismullie/closet.git
    cd ./closet
    bundle install

**Setting up a database**

[Install MongoDB](http://www.mongodb.org/display/DOCS/Quickstart) and start the server. Configuration options can be changed in `config/mongoid.rb`, but the default configuration will work if you are running MongoDB on your local machine on the default port.

### Running
  
    shotgun           # Serves app with Shotgun running Thin.
    foreman start     # Serves app with Foreman running Unicorn.

You may add the `-p XXX` option to specify the port on which to serve the app.

### Testing

**Spec Testing with RSpec**

You can run all spec tests or just one file:

    rake spec         # Run all the spec tests.
    rake spec name    # Run one spec test file.

Tests will run in random order. Configuration options can be changed in the `.rspec` file (in the root directory).

**Integration Testing with Capybara**

The integration tests can be run as follows:

    cucumber

The feature definitions are found in `/features`.

**Using Travis CI**

To use Travis for automated testing, go to the Travis website, and turn on Travis in the "Accounts" tab. Configuration options can be changed in the `.travis.yml` file (in the root directory).

### Deploying

Using Capistrano, you can deploy your app right from your public or private GitHub repo.
Edit your `config/deploy.rb` file to match your server and repository information. Then, run:

    cap deploy        # Deploy to remote server.

### Localization

**Dynamic Fields**

To make a Mongoid field localizable, add `localize: true` to the field options in the model file. In the database, insert a second field containing a hash with the text to use for each locale, e.g. `{en: 'hello', fr: 'bonjour'}`. The name of this field should be X_translations, where X is the name of the localized field.

**Localizing Static Fields**

Setup your static fields in config/locales/, following the examples provided. In your HAML template, use `translate :name` (or the short form `t :name`) to automatically insert the appropriate translation based on the user locale.

### Authentication

Closet comes with out-of-the-box user login and registration using Omniauth. To use Twitter, Facebook and/or Google within your application, register your app with the relevant service and enter your app keys in the `config/omniauth.rb` file. Sample keys are provided for you to test your setup.