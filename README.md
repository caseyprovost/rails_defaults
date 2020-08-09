# README

## What is this thing?

This is a highly opinionated skeleton for your next Ruby on Rails application. It has just the right amount &trade; of dependencies, features, and capabilities to get you up and running quickly.

What's under the hood?:

#### Architecture
* Postgres
* Puma (your rails server)
* Redis (for caching and Sidekiq)
* Sidekiq (for processing background jobs)
* ActiveStorage (for processing file attachments)
* Docker and Docker Compose (no more "works on my machine" problems for you)
* Stimulus Relex (because minimal Javascript is the way to go)
* Rollout (for feature toggling)
* Role based permissions (using Rolify, because it is super simple and easy to use)
* Lockbox (because you probably need to encrypt sometting)
* ElasticSearch & searchkick (because you probably need some awesome search features and aggregations)
* Environment-based credentials (because Rails 6 finally gave them to us!)

#### Developer Tooling
* Byebug with Break (for debugging)
* RSpec (because it makes testing fun, unlike Minitest :( )
* Factory bot (for easy test data creation with ultimate flexibility)
* Cuprite (trust me it's better than all other browser simulation libraries for testing)

#### Other Dependencies
* administrate (because you probably need an admin/cs portal)
* page (because pagination is always needed and pagy does it with style and pizazz)
* blind index (useful with Lockbox to index those encrypted fields)
* groupdate (makes querying data by date much more pleasant)
* Blazer (provides an interface for CS, Admin, or tech support to query data without needing an eningeer!)

#### Misc
* A default (idempotent) seeds file has been provided (db/seeds.rb)
* ViewComponent (a wonderful and easily testable way to create reusuable UI fragments)

#### Authentication
This app uses devise, because it is the industry default. By default this app includes most of the modules devise ships with, because I have found that I usually enable most of them over time anyway.

**important** I added `username` and `name` to devise. Feel free to edit the migration to remove those if you do not want them. Also make sure to remove the additions in the `users/registrations_controller` and `users/sessions_controller` that allow those params through.

#### Authorization
You don't want everyone to be able to access all the same data or pages! So Pundit, and Rolify are provided as the tools for you to implement permissions. To change your available roles just alter Roles::Names and re-run your seeds.

Default Roles: early_access, developer, tech_support, and customer_support

**important** The roles are used in feature toggling with Rollout. If you change them, you must reflect those changes in `config/rollout.rb`.

#### Front End
* Tailwind
* Font Awesome
* tailwindcss-stimulus-components (Thanks Chris Oliver!)
* Turbolinks (because SPAs are hot garbage)
* Stimulus (Javascript sprinkles are beautiful)
* Chartkick (because you probably need data charts and this library is fun to use!)

You will also notice that tailwind has already been used to re-skin the default devise views. This was shamelessly ripped from (https://github.com/justalever/kickoff_tailwind) and then slightly modified to be more gorgeous.

### Get Up And Running

* Install docker and docker compose (docker for Mac does both)
* from your app directory run `docker-compose up`

**Note** Ensure postgres, elastic search, and redis are not running locally. Their ports will conflict and the app will be sad.


### Questions?

If you have any questions or comments, please feel free to open an issue. PRs for new ideas or bugfixes are welcome...as long as they don't change how the app currently does something ;)