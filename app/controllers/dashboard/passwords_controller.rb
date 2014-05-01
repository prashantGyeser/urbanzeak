class PasswordsController < Devise::PasswordsController
  logger.debug "It is getting there"
  skip_before_filter :require_no_authentication, :only => [ :edit, :update]
end