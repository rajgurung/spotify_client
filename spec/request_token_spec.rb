require './lib/request_token.rb'
#require File.expand_path('../../../lib/request_token.rb', __FILE__)

describe RequestToken do
  context '.initialize' do
    let(:spotify) { RequestToken.instance }

    describe '.initialize' do
      it { spotify.respond_to?(:connection) }

      # it { spotify.respond_to?(send(:_access_token)) }
    end
  end
end
