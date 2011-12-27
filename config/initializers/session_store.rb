# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_casediary_session',
  :secret      => 'd8126351fd6a2797b369c60f688cbc22c491004e60faeb7494deadd9941292bf4be35e35da453854fbb971af0661b9d88a995d6846d73678df6a1dbc7c9ce414'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
