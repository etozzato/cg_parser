# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rails-it.com_session',
  :secret      => 'f76351ff6be92ad7a74e05ce54b46cb06fc25be70bd3e227b1ccf9583d719f48bd4dc262c4ce5cca9b6bf73d7adfaeb86e8125688d0770de57197481933249d7'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
