module CustomAuth
  module Devise
    module Strategies
      class Kerb < ::Devise::Strategies::Base
        def valid?
          params[:user] && (params[:user][:username] || params[:user][:password])
        end

        def authenticate!
          if check_kerb_auth(params[:username], params[:password])
            u = User.find(:first, 
              :conditions => { :username => params[:username] }) || 
              User.create({ :username => login }
            )
          else
            fail!("Could not log in")
          end
        end

        def check_kerb_auth(username, password)
          require 'krb5_auth'
          include Krb5Auth

          return false if username.blank? or password.blank?

          begin
            kerberos = Krb5.new
            return kerberos.get_init_creds_password(username, password)
          rescue Krb5Auth::Krb5::Exception
            return false
          end
        end
      end
    end
  end
end
