# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_regato_session',
  :secret      => 'e5dc8c35e8ac08894c6eac33067d14b4d0eefa3df4d711acaab791e491531bf1470928bbdb45a47877c8b9be5d012d3f3430e58568ac12946a7a63da88236264'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
