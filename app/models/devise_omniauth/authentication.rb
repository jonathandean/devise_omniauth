module DeviseOmniauth
  class Authentication < ActiveRecord::Base
    belongs_to :user
    attr_accessible :provider, :provider_id, :user

    def self.find_or_create_for_facebook_oauth(auth_info, signed_in_resource=nil)
      # Try to find an existing authentication
      auth = self.where(provider: auth_info.provider, provider_id: auth_info.uid).first
      # No existing authentication was found
      unless auth
        # Try to find a user with the email address contained in auth_info
        # TODO should we have the user confirm they want to link these?
        user = User.find_by_email(auth_info.info.email)
        # If there isn't a user, create one with the auth_info
        # TODO should the user confirm this and/or have the opportunity to link to a different email?
        unless user
          user = User.create(
            name: auth_info.extra.raw_info.name,
            email: auth_info.info.email,
            password: Devise.friendly_token[0, 20]
          )
        end
        # Create the Authentication for the user we found or created
        auth = self.create(
          user: user,
          provider: auth_info.provider,
          provider_id: auth_info.uid
        )
      end
      # Return the Authentication
      auth
    end
  end
end
