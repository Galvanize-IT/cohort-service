require 'spec_helper'

describe CohortService do

  it "has a version number" do
    expect(CohortService::VERSION).not_to be nil
  end

  it "provides an interface for me to easily get information" do
    allow(CohortService::Cohort).to receive(:new).with('11-XX-FS-DP').and_call_original

    results = described_class.cohort_info('11-XX-FS-DP')
    expect(results).to eq({
      course: "Web Development Immersive",
      education: "Web Development",
      campus: "Denver - Platte",
      label: "11-XX-FS-DP",
      location: {
        value: "1644 Platte St, Denver, CO 80202",
        area: "Denver, CO",
        lat: 39.757657,
        lng: -105.006953
      }
    })
  end

  it "provides the ability to use the data directly" do
    expect(described_class.data.keys).to eq(['products', 'campuses'])
  end

end
