require 'omniauth-oauth2'
require 'multi_json'
require 'logger'

module OmniAuth
  module Strategies
    class EveOnline < OmniAuth::Strategies::OAuth2
      option :name, 'eve_online'

      option :client_options, {:site => "https://login.eveonline.com",
                               :authorize_url => '/oauth/authorize',
                               :token_url => '/oauth/token'}

      def authorize_params
        super.tap do |params|
          %w[scope].each do |k|
            if request.params[k]
              params[k.to_sym] = request.params[k]
            end
          end
        end
      end

      uid { raw_info['CharacterID'] }

      info do
        {
            :character_id => raw_info['CharacterID'],
            :character_name => raw_info['CharacterName'],
            :expires_on => raw_info['ExpiresOn'],
            :token_type => @raw_info['TokenType']
        }
      end

      extra do
        {
        }
      end

      def request_phase
        super
      end

      def callback_phase
        super
      end

      def raw_info
        @raw_info ||= access_token.get("https://login.eveonline.com/oauth/verify").parsed
      end
    end
  end
end
