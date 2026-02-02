module CapTp
  class Connector
    CAPTP_VERSION = '1' # placeholder
    # object_to_connect_to should be CapTp::Connectable
    def initialize (object_to_connect_to)
      @captp_version = CAPTP_VERSION
      @session_pubkey = session_pubkey
      @acceptable_location = object_to_connect_to.location
      @acceptable_location_sig = object_to_connect_to.location_signature
    end

    def connect
      # TODO
      #<op:start-session captp-version            ; String value
      #                  session-pubkey           ; CapTP public key value
      #                  acceptable-location      ; OCapN Reference type
      #                  acceptable-location-sig> ; CapTP signature
    end

    private def session_keypair
      @session_keypair ||= { pub: 'foo', private: 'bar'}
      # TODO - generate real stuff & do private key privacy things
    end

    private def session_pubkey
      session_keypair[:pub]
    end
  end
end

module CapTp
  module Connectable
    def location
      ''
    end

    def location_signature
      ''
    end
  end
end
