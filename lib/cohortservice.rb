require "date"
require "yaml"

require "cohortservice/version"
require "cohortservice/cohort"

module CohortService
  class ValidationError < StandardError; end

  def self.cohort_info(cohort_label)
    Cohort.new(cohort_label).info
  end

  def self.data
    @data ||= YAML.load_file(File.expand_path("../data.yml", __FILE__))
  end

end
