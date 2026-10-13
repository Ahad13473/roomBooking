Local Development Setup
Prerequisites

Before running the application, install the Ruby version specified by the project, Bundler, and the required database.

Installation
Clone the repository:
   git clone https://github.com/Ahad13473/roomBooking.git
   cd roomBooking

Install dependencies:
   bundle install

Configure environment variables and database credentials according to the project's configuration.
Create and migrate the database:
   bin/rails db:create
   bin/rails db:migrate

Start the application:
   bin/rails server

Open http://localhost:3000 in your browser.
Troubleshooting
If a Ruby version error occurs, install the version required by the project.
If dependency installation fails, check the Ruby version and Bundler compatibility.
If database commands fail, verify the database service and credentials.
Never commit passwords, API keys, or other secrets to the repository.