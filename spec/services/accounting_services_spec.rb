require "rails_helper"
require_relative '../../app/services/accounting_service'

describe Accounting do
  let(:data) { "{\"id\":1,\"restaurant_count\":59,\"singleton_guard\":0,\"dish_count\":116,\"created_at\":\"2020-04-25T12:20:20.049Z\",\"updated_at\":\"2020-05-11T12:17:26.600Z\"}" }

  context 'with new data input' do
    it "broadcast the correct data" do
      expect {
        described_class.push(data)
      }.to have_broadcasted_to("datas").with({"type":"accounting","restaurant_count":59,"dish_count":116})
    end
  end
end
