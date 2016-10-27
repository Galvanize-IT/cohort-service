require 'spec_helper'

describe Cohortservice::Cohort do
  subject { described_class.new('15-XX-WD-DP') }

  describe "validation" do

    it "raises an exception if the cohort label seems invalid" do
      expect { described_class.new('XX-XX-XX-XX') }.to raise_error(Cohortservice::ValidationError)

      # years must be between 2001 and 2030
      expect { described_class.new('XX-XX-FS-DP') }.to raise_error(Cohortservice::ValidationError)
      expect { described_class.new('10-XX-FS-DP') }.to raise_error(Cohortservice::ValidationError)
      expect { described_class.new('11-XX-FS-DP') }.to_not raise_error
      expect { described_class.new('31-XX-FS-DP') }.to raise_error(Cohortservice::ValidationError)

      # product must be understood
      expect { described_class.new('11-XX-XX-DP') }.to raise_error(Cohortservice::ValidationError)

      # campus must be understood
      expect { described_class.new('11-XX-FS-XX') }.to raise_error(Cohortservice::ValidationError)
    end

  end

  describe "#info" do

    it "returns the complete cohort info" do
      expect(subject.info).to eq({
        course: 'Web Development Immersive',
        education: 'Web Development',
        campus: 'Denver - Platte',
        label: '15-XX-WD-DP',
        location: {
          value: '1644 Platte St, Denver, CO 80202',
          area: 'Denver, CO',
          lat: 39.757657,
          lng: -105.006953
        }
      })
    end

  end

  describe "#course" do

    it "returns the course determined" do
      expect(subject.course).to eq('Web Development Immersive')
    end

  end

  describe "#education" do

    it "returns the education determined" do
      expect(subject.education).to eq('Web Development')
    end

  end

  describe "#campus" do

    it "returns the campus name determined" do
      expect(subject.campus).to eq('Denver - Platte')
    end

  end

  describe "#location" do

    it "returns the location determined" do
      expect(subject.location).to eq({
        value: '1644 Platte St, Denver, CO 80202',
        area: 'Denver, CO',
        lat: 39.757657,
        lng: -105.006953
      })
    end

  end

  describe "#latlng" do

    it "returns the correct latitude and longitude determined" do
      expect(subject.latlng).to eq({
        lat: 39.757657,
        lng: -105.006953
      })
    end

  end
end
