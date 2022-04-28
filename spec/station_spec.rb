require 'station'
require 'oystercard'

describe Station do

  subject {described_class.new(name: "Old Street", zone: 1)}

  it "Checks the name of a station" do
    expect(subject.name).to eq("Old Street")
  end

  it "Checks the zone of a station" do
    expect(subject.zone).to eq(1)
  end

  # it "expects station to return the station name" do
  #   expect(subject).to respond_to(:name).with(1).argument
  # end




end