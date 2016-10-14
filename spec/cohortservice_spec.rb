require 'spec_helper'

describe Cohortservice do
  it 'has a version number' do
    expect(Cohortservice::VERSION).not_to be nil
  end

  it 'should return value of a campus' do
    expect(Cohortservice.value('Denver - Golden Triangle')).to eq '1062 Delaware St, Denver, CO 80204'
  end

  it 'should return area of a campus' do
    expect(Cohortservice.area('Denver - Golden Triangle')).to eq 'Denver, CO'
  end

  # it 'should return the correct address for all campuses'

  it 'should return lat long of a campus' do
    expect(Cohortservice.latlon('Denver - Golden Triangle')).to eq({lat: 39.733513, lng: -104.992588})
  end

  # it 'should return the correct lat longs for all campuses'

  it 'should return cohorts info' do
    expect(Cohortservice.cohort_info('15-10-WD-DP')).to eq({
      start_date_full: Date.new(2015,10,01),
      start_date: '10 2015',
      end_date_full: Date.new(2016,04,01),
      end_date: '4 2016',
      education: 'Web Development',
      campus: 'Denver - Platte',
      campus_info: {value: '1644 Platte St, Denver, CO 80202', area: 'Denver, CO', lat: 39.757657, lng: -105.006953}
                                                           })
  end

  it 'should assign education properly' do
    expect(Cohortservice.define_education('DS')).to eq 'Data Science'
    expect(Cohortservice.define_education('FS')).to eq 'Web Development'
    expect(Cohortservice.define_education('WD')).to eq 'Web Development'
    expect(Cohortservice.define_education('GU')).to eq 'Galvanize University'
    expect(Cohortservice.define_education('UX')).to eq ''
  end

  it 'should define campus properly' do
    expect(Cohortservice.define_campus 'DG').to eq 'Denver - Golden Triangle'
    expect(Cohortservice.define_campus 'DP').to eq 'Denver - Platte'
    expect(Cohortservice.define_campus 'SF').to eq 'San Francisco - SoMa'
    expect(Cohortservice.define_campus 'AUS').to eq 'Austin - 2nd St District'
    expect(Cohortservice.define_campus 'SEA').to eq 'Seattle - Pioneer Square'
    expect(Cohortservice.define_campus 'BD').to eq 'Boulder - Walnut St.'
    expect(Cohortservice.define_campus 'FC').to eq 'Fort Collins - Old Town'
    expect(Cohortservice.define_campus 'PHX').to eq 'Phoenix - Warehouse District'
    expect(Cohortservice.define_campus 'NYC').to eq 'New York - Soho West'
    expect(Cohortservice.define_campus 'QRS').to eq ''
  end

end
