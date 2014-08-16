# BroadCastor

A minimalistic timeline

## Set up your development environment

This application uses `bower, so you need to install vendored dependencies like this:

    $ bower install

Once you installed the assets, you need to install ruby dependencies with `bundler`:

    $ bundle install

You'll also need to set up the database:

    $ sudo -u postgres createuser broadcastor
    $ sudo -u postgres psql --command "ALTER USER broadcastor WITH PASSWORD 'your password';"
    $ sudo -u postgres createdb --owner broadcastor broadcastor_development
    $ rake db:migrate
    $ rake db:seed
