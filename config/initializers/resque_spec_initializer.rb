# This allows Resque to work synchronously in testing.
Resque.inline = Rails.env.test?