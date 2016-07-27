class CoordinateCreator
  attr_reader :data_hash, :start_x, :start_y, :radius,
  :ellipse_size, :base_case, :expansion_rate

  def initialize(fb_data)
    @data_hash = fb_data
    @start_x
    @start_y
    @radius
    @ellipse_size
    @base_case
    @expansion_rate
    main_converter
  end

  def fractal_parameters
    {
      x: @start_x,
      y: @start_y,
      radius: @radius,
      size: @ellipse_size,
      base_case: @base_case,
      rate: @expansion_rate
    }
  end

  private

  def convert_first_name_to_x
    first_name = data_hash['first_name']
    @start_x = first_name.length
  end

  def convert_last_name_to_y
    last_name = data_hash['last_name']
    @start_y = last_name.length
  end

  def convert_id_to_radius
    id = data_hash['id']
    @radius = id.length
  end

  def convert_link_to_ellipse_size
    link = data_hash['link']
    @ellipse_size = [link.length, link.length]
  end

  def convert_age_range_to_base_case
    age_min = data_hash['age_range']['min']
    @base_case = age_min
  end

  def convert_gender_to_expansion_rate
    gender = data_hash['gender']
    if gender == 'male'
      @expansion_rate = 2
    else
      @expansion_rate = 3
    end
  end

  def main_converter
    convert_first_name_to_x
    convert_last_name_to_y
    convert_id_to_radius
    convert_link_to_ellipse_size
    convert_age_range_to_base_case
    convert_gender_to_expansion_rate
  end
end
