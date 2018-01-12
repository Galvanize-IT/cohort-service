class CohortService::Cohort

  def initialize(label)
    @label = label
    @parts = Parts.new(label.to_s.gsub("(", "-").split('-'))
    raise CohortService::ValidationError unless @parts.valid?
  end

  def info
    @info ||= {
      course: CohortService.data['products'][@parts.product]['course'],
      education: CohortService.data['products'][@parts.product]['education'],
      campus: CohortService.data['campuses'][@parts.campus]['name'],
      label: @label,
      location: CohortService.data['campuses'][@parts.campus]['location']
    }
  end

  def course
    info[:course]
  end

  def education
    info[:education]
  end

  def campus
    info[:campus]
  end

  def location
    info[:location]
  end

  def latlng
    {
      lat: info[:location][:lat],
      lng: info[:location][:lng],
    }
  end

  class Parts
    attr_reader :year, :month, :product, :campus

    def initialize(parts_array)
      @year = parts_array[0].to_i
      @sequence = parts_array[1]
      @product = parts_array[2]
      @campus = parts_array[3]
    end

    def valid?
      return false if year < 11 || year > 30
      return false if CohortService.data['products'][product].nil?
      return false if CohortService.data['campuses'][campus].nil?
      true
    end
    
  end
end
