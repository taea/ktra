# Be sure to restart your server when you modify this file.

Ktra::Application.config.session_store :cookie_store, key: ENV['SESSION_KEY'] || "_ktra_session_#{Rails.env}", expire_after: 1.months

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Ktra::Application.config.session_store :active_record_store
