## Closet

Is a barebones Sinatra application, loaded with the following goodies:

- Layouts using `haml`, styling with `sass` and Bootstrap for base CSS.
- Out-of-the-box authentication with `omniauth` (Facebook, Twitter, Google).
- MongoDB integration with `mongoid` and a barebones OAuth User model.
- Localization of both static and dynamic (database) fields with `i18n`.
- Asset compilation using `sinatra-assetpack`, JS compression with `uglifier`.
- Automatic code reloading with `shotgun` + `thin` for development.
- Load balancing with `foreman` + `unicorn` for app serving and scaling.
- Support for `better_errors` console when running in development mode.
- Support for Markdown using `redcarpet` and highlighting with `coderay`.
- Spec testing with `rspec` and integration testing with `capybara`.
- Direct deployment from a git repository using `capistrano`.

Why should you use Closet? Because each of its components have been carefully chosen and integrated to yield a skeleton that just works (tm), right out of the box.

### Installing

**Download and install dependencies**

Clone the files to your computer and install gem dependencies:

    git clone git://github.com/louismullie/closet.git
    cd ./closet
    bundle install

**Setting up a database**

[Install MongoDB](http://www.mongodb.org/display/DOCS/Quickstart) and start the server. Configuration options can be changed in `config/mongoid.yml`, but the default configuration will work if you are running MongoDB on your local machine on the default port.

### Running
  
    shotgun           # Serves app with Shotgun running Thin.
    foreman start     # Serves app with Foreman running Unicorn.

You may add the `-p XXX` option to specify the port on which to serve the app.

### Authentication

Closet comes with out-of-the-box user login and registration using Omniauth. To use Twitter, Facebook and/or Google within your application, register your app with the relevant service and enter your app keys in the `config/omniauth.rb` file. Sample keys are provided for you to test your setup.

Getting Omniauth to work on a local machine is a bit tricky to do. Here is a sample setup for each of the three supported providers that I have found to work well:

[Twitter API](https://dev.twitter.com/)
- Website: `http://127.0.0.1:5000`
- Callback URL: `http://127.0.0.1:5000/auth/twitter/callback`

[Facebook API](https://developers.facebook.com/)
- App domain: `localhost`
- Site URL: `http://localhost:5000`

[Google API](https://code.google.com/apis/console/)
- Home page URL: 127.0.0.1

If there's a better way, please let me know.

### Localization

**Localizing Static Fields**

Setup your static fields in config/locales/, following the examples provided. In your HAML template, use `translate :name` (or the short form `t :name`) to automatically insert the appropriate translation based on the user locale.

**Dynamic Fields**

To make the Mongoid field X localizable, add `localize: true` to the X's options in the model file. In the database, create a second field named `X_translations`, replacing `X` by the name of the field. Inside `X_translations`, insert a hash with the text to use for each locale, e.g. `{en: 'hello', fr: 'bonjour'}`.

### Testing

**Spec Testing with RSpec**

You can run all spec tests or just one file:

    rake spec         # Run all the spec tests.
    rake spec name    # Run one spec test file.

Tests will run in random order. Configuration options can be changed in the `.rspec` file (in the root directory).

**Integration Testing with Capybara**

The integration tests can be run as follows:

    cucumber

The feature definitions can be found in `/features`.

**Using Travis CI**

To use Travis for automated testing, go to the Travis website, and turn on Travis in the "Accounts" tab. Configuration options can be changed in the `.travis.yml` file (in the root directory).

### Deploying

Using Capistrano, you can deploy your app right from your public or private GitHub repo. First, you need to create an account for your user on your remote machine (do *not* run as root, and if you must, use an encrypted shell).  Then, edit your `config/deploy.rb` file to match your server and repository information. Then, run:

    cap deploy        # Deploy to remote server.