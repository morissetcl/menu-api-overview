require "rails_helper"
require_relative '../../app/services/dish_service'

describe Dish do
  let(:data) { "{\"id\":261362,\"title\":\"steak\",\"price\":19,\"description\":\"well done\",\"restaurant_id\":8655,\"created_at\":\"2020-05-06T15:58:02.168Z\",\"updated_at\":\"2020-05-06T15:58:02.168Z\"}" }

  context 'with new data input' do
    it "broadcast the correct data" do
      expect {
        described_class.push(data)
      }.to have_broadcasted_to("datas").with({"type":"dish","name":"steak","price":19,"description":"well done"})
    end
  end
end
