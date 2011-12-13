# Basic Sinatra App

This is a basic sinatra app, ready for heroku, or local deployment. It uses sequel and less to deal with the db and css.

If you are using heroku, try creating your app with `heroku create APP_NAME -s cedar`.

To run your site locally, run `rackup`.

## Database Stuff

Add migrations by adding files to `db/migrations/` and then run `rake db` to migrate the db.

## Resources

 * [Sinatra Documentation](http://www.sinatrarb.com/intro)
 * [Sequel Cheatsheet](http://cheat.errtheblog.com/s/sequel/)
 * [Sequel Model HowTo](http://sequel.rubyforge.org/rdoc/files/doc/association_basics_rdoc.html)
