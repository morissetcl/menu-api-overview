require "rails_helper"
require_relative '../../app/services/restaurant_service'

describe Restaurant do
  let(:data) { "{\"id\":8656,\"name\":\"Chez JenJak\",\"slug\":null,\"city\":\"Paris\",\"zip_code\":\"75018\",\"street\":\"rue de la belle\",\"department\":null,\"tags\":[],\"text\":[],\"latitude\":null,\"longitude\":null,\"source\":null,\"address\":null,\"created_at\":\"2020-05-06T16:10:54.579Z\",\"updated_at\":\"2020-05-06T16:10:54.579Z\"}" }

  context 'with new data input' do
    it "broadcast the correct data" do
      expect {
        described_class.push(data)
      }.to have_broadcasted_to("datas").with({"type":"restaurant","name":"Chez JenJak","city":"Paris","zip_code":"75018","street":"rue de la belle"})
    end
  end
end
