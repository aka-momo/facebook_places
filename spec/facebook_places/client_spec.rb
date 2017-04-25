require 'spec_helper'

RSpec.describe FacebookPlaces::Client do
  describe FacebookPlaces::Client do
    describe 'initialize a client' do
      it 'should be able to initialize client with access_token param' do
        client = FacebookPlaces::Client.new('abc123')
        expect(client.access_token).to eq 'abc123'
      end

      it 'should raise error when no access_token token is provided' do
        expect { FacebookPlaces::Client.new }.to raise_error(ArgumentError)
      end
    end
  end
end
