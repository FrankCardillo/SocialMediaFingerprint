class CoordinateCreator
  attr_reader :data_hash, :start_x, :start_y, :radius,
  :ellipse_size, :base_case, :expansion_rate, :color

  def initialize(fb_data)
    @data_hash = fb_data
    @start_x
    @start_y
    @radius
    @ellipse_size
    @base_case
    @expansion_rate
    @color
    main_converter
  end

  def fractal_parameters
    {
      x: @start_x,
      y: @start_y,
      radius: @radius,
      size: @ellipse_size,
      base_case: @base_case,
      rate: @expansion_rate,
      color: @color
    }
  end

  private

  def convert_first_name_to_x_y
    first_name = data_hash['first_name']

    if first_name.length < 20
      @start_x = first_name.length * 20
      @start_y = first_name.length * 20
    else
      @start_x = first_name.length * 15
      @start_y = first_name.length * 15
    end
  end

  def convert_last_name_to_color
    last_name = data_hash['last_name']
    vowels = ['a', 'e', 'i', 'o', 'u', 'y']
    vowel_colors = ['red', 'blue', 'yellow']
    consonant_colors = ['green', 'purple', 'black']

    if vowels.include?(last_name[0])
      @color = vowel_colors.sample
    else
      @color = consonant_colors.sample
    end
  end

  def convert_id_to_radius
    id = data_hash['id']
    @radius = id.length * 5
  end

  def convert_link_to_ellipse_size
    link = data_hash['link']
    size = link.length / 10
    @ellipse_size = [size, size]
  end

  def convert_age_range_to_base_case
    age_min = data_hash['age_range']['min']
    @base_case = age_min / 6
  end

  def convert_gender_to_expansion_rate
    gender = data_hash['gender']
    expansion_rates_male = [2, 3, 4, 5]
    expansion_rates_female = [1, 3, 6, 2, 7]

    if gender == 'male'
      @expansion_rate = expansion_rates_male.sample
    else
      @expansion_rate = expansion_rates_female.sample
    end
  end

  def main_converter
    convert_first_name_to_x_y
    convert_last_name_to_color
    convert_id_to_radius
    convert_link_to_ellipse_size
    convert_age_range_to_base_case
    convert_gender_to_expansion_rate
  end
end
