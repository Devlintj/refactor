require 'minitest/autorun'
require './utilities'

# write tests here
describe 'utilities' do

  describe 'leap_year?' do
    it 'multiples of 4 is a leap year' do
      leap_year?(2016).must_equal(true)
      leap_year?(2012).must_equal(true)
      leap_year?(2020).must_equal(true)
    end


    it 'multiples of 400 and 100 is a leap year' do
      leap_year?(2000).must_equal(true)
      leap_year?(1600).must_equal(true)
      leap_year?(1200).must_equal(true)
    end

    it 'multiples of 100 are not leap years when they arent multiples of 4' do
      leap_year?(1800).must_equal(false)
      leap_year?(2100).must_equal(false)
      leap_year?(1900).must_equal(false)
    end

    it 'non multiples of 4 are not leap years' do
      leap_year?(2015).must_equal(false)
    end
  end
end
