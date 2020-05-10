require "rails_helper"

describe DatasChannel, type: :channel do
  before { subscribe }
  it "is reachable" do
    expect(subscription).to be_confirmed
  end

  it "has the correct stream name" do
    expect(subscription).to have_stream_from("datas")
  end
end
