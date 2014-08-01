# BroadCastor

A minimalistic timeline

## How to install

This application uses `bower`, so you need to install vendor dependencies like this:

    bower install

Once you installed the assets, you need to install ruby dependencies with `bundler`:

    bundler

You'll also need to set up the database:

    rake db:migrate
    rake db:seed