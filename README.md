# Rails Boilerplate (created by Jackson Hoang)
- Learn how to use rails here (http://guides.rubyonrails.org/).
- This is a basic boilerplate, for a boilerplate including auth (Signup, Login, Reset Password, Change Password), checkout the `auth` branch of this repo.

## Setup
1. Pull down the repo: `git clone git@github.com:jkhoang313/rails-boilerplate.git`.
  - Alternatively, run `git clone -b authed git@github.com:jkhoang313/rails-boilerplate.git` if you want to start from the `authed` branch.
2. Rename the directory to be the name of your GitHub repo: `mv rails-boilerplate {name_of_github_repo}`
3. Navigate to the newly created directory: `cd {name_of_github_repo}`.
  - If you started from the `authed` branch, checkout to a `master` branch: `git checkout -b master`.
4. Set the remote origin to target your GitHub repo: `git remote set-url origin {github_repo_url}`
5. Push up the code to your GitHub repo: `git push -u origin master`
6. Install the required gems: `bundle install`.
7. Install mailcatcher (cannot be included in Gemfile because of conflicts with other gems): `gem install mailcatcher`.
  - Run `mailcatcher` to run the mailcatcher server (can be accessed in browser at `http://127.0.0.1:1080`).
5. Remove any files with a `.remove` extension

## Create Database
- Create a database with: `createdb {db_name}` (db_name is the name your database).
  - Replace all instances of `boilerplate_db` in the codebase with your db_name.
- You can save the current state of your database using `make save_db` (will be saved in the `db_seed.dump` file)
  - If you want to send someone your current db state, send them the `db_seed.dump` file.
- Run `rails s` to run the server or `make backend` to run the server and reset the database to your last saved state.
- Your local backend will be at `http://localhost:8000/`.

## Required ENV Variables
- Create a `.env` file with the same keys as `.env-example`.
- Set `FRONTEND_URL` equal to the url of the matching frontend.
- Set `SECRET_KEY` equal to a random secret key (will be used to encrypt).
- Set `DATABASE_URL` equal to the same value as in `.env-example` (replacing "boilerplate_db" with the name of your "db_name").
- Delete `.env-example` file.

## Database Seeding
- You can save the current state of your database by running `make save_db`. This will save to the `db_seed.dump` file (which is not git-tracked). You can send this file to another user and they will have access to the current state of your database.
- By running `make backend` (recommended method), you are doing the following:
  - Dropping your current instance of the database (make sure you are not running the server or have it open in "postico") or this command will fail.
  - Creating a new, clean instance of your database.
  - Restoring the database to the state determined by the `db_seed.dump` file.
  - Starting up the rails server.
  - Advantages:
    - It is easier to create instances of a database whenever you make small changes.
    - It is generally faster to run.
  - Disadvantages:
    - It is difficult to recover old instances of your database if you want to undo a recent change.
    - If multiple people alter this file, it is difficult to settle merge conflicts.
    - If you want to create many model instances, you have to either create a method/script to iterate and create, and then run that method/script. Or you have to go into the terminal and create them manually.
- Alternatively, you could create an instance of the server using the `make load_from_seeds_file` command which does the following:
  - Dropping your current instance of the database (make sure you are not running the server or have it open in "postico") or this command will fail.
  - Creating a new, clean instance of your database.
  - Running `rake db:seed` which will instantiate the database using methods you wrote in the `db/seeds.rb` file.
  - Starting up the rails server.
  - Advantages:
    - It is explicitly clear what your database will look like if you start up your database this way. You only have to look at the `seeds.rb` file.
    - Creating many instances is easier because you can create methods that iterate in the `seeds.rb` file (which can be referenced later in the future).
  - Disadvantages:
    - If you want to make a small change, you have to update it in your `seeds.rb` file, and then re-run the entire script.
    - Also, the seeding may take a long time if you are creating many model instances.

## Running tests
- `rspec-rails` library used to run tests (http://www.rubydoc.info/gems/rspec-rails/frames).
- Add tests in the `spec` folder.
- Run `make test` or `bundle exec rspec` to run all the tests.
- Run `bundle exec rspec {path_to_directory/file}` to run a specific folder or file.
  - E.g. `bundle exec rspec spec/controllers`.

## Adding Heroku Remotes
1. Create a Heroku repo for your staging application.
2. Add the Heroku repo to a remote by running: `heroku git:remote -a {name_of_heroku_app}`.
3. Rename the remote alias to be "staging" by running: `git remote rename heroku staging`.
4. Repeat for your production Heroku repo by replacing "name_of_heroku_app" with your production heroku app and replacing "staging" in step 3 with "production".
5. Install the SendGrid add-on on Heroku to enable emailing.

## Deploying to Heroku
1. Merge your feature branches to the "dev" branch.
2. Run `make test` on the "dev" branch and make sure tests pass. If they do not pass, update code to make them pass.
3. Checkout your master branch:
  - Run `git merge dev` to merge your "dev" branch to the "master" branch.
  - Run `git push origin master` to update your github repo's master branch.
  - Run `make staging` or `make prod` to update your staging or production app.
