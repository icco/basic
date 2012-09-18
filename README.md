# Basic App

This is a basic sinatra app, using the [Padrino](http://padrinorb.com) framework. The app is ready for Heroku, or local deployment. It uses active_record to deal with the db, erb for templating and less for css.

If you are using heroku, try creating your app with `heroku create APP_NAME -s cedar`.

To run your site locally, run `rackup` or `shotgun`.

## Database Stuff

Add migrations by adding files to `db/migrations/` and then run `rake ar:migrate` to migrate the db.

## Resources

 * [Sinatra Documentation](http://www.sinatrarb.com/intro)
