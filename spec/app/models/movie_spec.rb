require 'rails_helper'

RSpec.describe Movie, type: :model do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:released_on) }
  it { is_expected.to validate_length_of(:description).is_at_least(25) }
  it { is_expected.to validate_numericality_of(:total_gross).is_greater_than_or_equal_to(0) }

  describe 'image_file_name' do
    it { should allow_value('image.jpg').for(:image_file_name) }
    it { should allow_value('image.png').for(:image_file_name) }
    it { should_not allow_value('image.gif').for(:image_file_name).with_message('must be a JPG or PNG image') }
    it { should_not allow_value('image.pdf').for(:image_file_name).with_message('must be a JPG or PNG image') }
    it { should_not allow_value('image').for(:image_file_name).with_message('must be a JPG or PNG image') }
  end

  it { should validate_inclusion_of(:rating).in_array(Movie::RATINGS) }
end
