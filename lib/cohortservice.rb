require "cohortservice/version"
require "data/data"
require "date"

module Cohortservice

  def self.value(campus)
    @data = Data.data
    return nil unless @data[:campuses][campus.to_sym]
    @data[:campuses][campus.to_sym][:value]
  end

  def self.area(campus)
    @data = Data.data
    return nil unless @data[:campuses][campus.to_sym]
    @data[:campuses][campus.to_sym][:area]
  end

  def self.latlon(campus)
    @data = Data.data
    return nil unless @data[:campuses][campus.to_sym]
    latlng = {}
    latlng[:lat] = @data[:campuses][campus.to_sym][:lat]
    latlng[:lon] = @data[:campuses][campus.to_sym][:long]
    latlng
  end

  def self.cohort_info(cohort_label)
    # return nil unless validate_cohort cohort_label
    cohort = cohort_label.split('-')
    cohort_info = {}

    date = Date.parse("01-#{cohort[1]}-20#{cohort[0]}")
    end_date = date+183

    education = define_education cohort[2]
    campus = define_campus cohort[3]

    cohort_info[:start_date_full] = date
    cohort_info[:start_date] = "#{date.mon} #{date.year}"
    cohort_info[:end_date_full] = end_date
    cohort_info[:end_date] = "#{end_date.mon} #{end_date.year}"
    cohort_info[:education] = education
    cohort_info[:campus] = campus
    cohort_info[:campus_info] = @data[:campuses][campus.to_sym]

    cohort_info
  end

  private

  def self.define_education(education_code)
    case education_code
      when 'DS'
        education = 'Data Science'
      when 'FS', 'WD'
        education = 'Web Development'
      when 'GU'
        education = 'Galvanize University'
      else
        education = ''
    end
    education
  end

  def self.define_campus(campus_code)
    case campus_code
      when 'DG'
        campus = 'Denver - Golden Triangle'
      when 'DP'
        campus = 'Denver - Platte'
      when 'SF'
        campus = 'San Francisco - SoMa'
      when 'AUS'
        campus = 'Austin - 2nd St District'
      when 'SEA'
        campus = 'Seattle - Pioneer Square'
      when 'BD'
        campus = 'Boulder - Walnut St.'
      when 'FC'
        campus = 'Fort Collins - Old Town'
      when 'PHX'
        campus = 'Phoenix - Warehouse District'
      when 'NYC'
        campus = 'New York - Soho West'
      else
        campus = ''
    end
    campus
  end

  def self.validate_cohort(cohort_label)
    @data[:cohorts].each do |c|
      return true if c == cohort_label
    end
    false
  end
end
