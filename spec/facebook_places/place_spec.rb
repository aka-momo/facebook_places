require 'spec_helper'

RSpec.describe FacebookPlaces::Place do
  describe FacebookPlaces::Client do
    before do
      # initialize a client
      @client = FacebookPlaces::Client.new(ACCESS_TOKEN)
    end

    it 'should request a single place by place_id:624712967657878', :vcr do
      place_id = '624712967657878'
      place = @client.find(place_id)
      expect(place.name).to eq 'Murphies'
      expect(place.id).to eq place.id
    end

    describe 'search Facebook places' do
      it 'should request places by query name', :vcr do
        name     = 'Murphies'
        places   = @client.search(q: name).data
        expect(places).not_to eq nil
      end

      it 'should request places by center', :vcr do
        center   = '28.3852377,-81.566068'
        places   = @client.search(center: center).data
        expect(places).not_to eq nil
      end

      it 'should request places by query name and distance', :vcr do
        center   = '28.3852377,-81.566068'
        distance = 1000
        places   = @client.search(center: center, distance: distance).data
        expect(places).not_to eq nil
      end

      it 'should request places by center and distance', :vcr do
        center   = '28.3852377,-81.566068'
        distance = 1000
        places   = @client.search(center: center, distance: distance).data
        expect(places).not_to eq nil
      end

      it 'should list detailed places using fields param', :vcr do
        center   = '28.3852377,-81.566068'
        fields   = %w[name context link]
        places   = @client.search(center: center, fields: fields).data
        places.each do |place|
          expect(place.name).not_to be_nil
          expect(place.context).not_to be_nil
          expect(place.link).not_to be_nil
        end
      end

      it 'should log error when passing bad input format', :vcr do
        center = 'lat,long'
        expect { @client.search(center: center) }.to raise_error(StandardError)
      end
    end

    describe 'pagination', :vcr do
      it 'should return next page', :vcr do
        name     = 'Murphies'
        places   = @client.search(q: name)
        expect(places.next_page).not_to eq nil
      end

      it 'should not return next page for find by id query', :vcr do
        place_id = '624712967657878'
        place    = @client.find(place_id)
        expect(place.next_page).to eq nil
      end
    end
  end
end
