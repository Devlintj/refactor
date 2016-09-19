require 'minitest/autorun'
require './utilities'

# write tests here
describe 'utilities' do

  describe 'leap_year' do
    it 'multiples of 4 is a leap year' do
      leap_year(2016).must_equal(true)
      leap_year(2012).must_equal(true)
      leap_year(2020).must_equal(true)
    end


    it 'multiples of 400 and 100 is a leap year' do
      leap_year(2000).must_equal(true)
      leap_year(1600).must_equal(true)
      leap_year(1200).must_equal(true)
    end

    it 'multiples of 100 are not leap years when they arent multiples of 4' do
      leap_year(1800).must_equal(false)
      leap_year(2100).must_equal(false)
      leap_year(1900).must_equal(false)
    end

    it 'non multiples of 4 are not leap years' do
      leap_year(2015).must_equal(false)
    end
  end

  describe 'percentage_of_year' do
    it 'should show what tenths place of the year you are in' do
      percentage_of_year(31536000).must_equal('100.0%')
    end

    it 'should show what tenths place of the year you are in' do
      percentage_of_year(15768000).must_equal('50.0%')
    end

    it 'should show what tenths place of the year you are in' do
      percentage_of_year(7884000).must_equal('25.0%')
    end

    it 'should show what tenths place of the year you are in' do
      percentage_of_year(3942000).must_equal('12.5%')
    end
  end

  describe 'standard_to_military' do
    it 'convert standard to military time' do
      standard_to_military('1:00 am').must_equal('1:00')
    end

    it 'should convert standard to military time' do
      standard_to_military('1:00 pm').must_equal('13:00')
    end

    it 'should convert standard to military time' do
      standard_to_military('2:00 PM').must_equal('14:00')
    end
  end

  describe 'military_to_standard' do
    it 'should convert military to standard time' do
      military_to_standard('1:00').must_equal('1:00 am')
    end

    it 'should convert military to standard time' do
      military_to_standard('13:00').must_equal('1:00 pm')
    end

    it 'should convert military to standard time' do
      military_to_standard('14:05').must_equal('2:05 pm')
    end

    it 'should convert military to standard time' do
      military_to_standard('12:00').must_equal('12:00 pm')
    end

    it 'should convert military to standard time' do
      military_to_standard('0:00').must_equal('12:00 am')
    end
  end

  describe 'bedtime' do
    it 'should not be bedtime if after 10:00 and is weekend' do
      bedtime('12:00 pm', true).must_equal(false)
    end

    it 'should not be bedtime if after 8:00 and is weekend' do
      bedtime('8:00 pm', true).must_equal(false)
    end

    it 'should be bedtime if is 8:00 and is not weekend' do
      bedtime('8:00 pm', false).must_equal(true)
    end

    it 'should be bedtime if 4:00 and weekend' do
      bedtime('4:00 pm', true).must_equal(true)
    end

    it 'should be bedtime if 1:00 am and is not weekend' do
      bedtime('1:00 am', false).must_equal(true)
    end

    it 'should be bedtime if 1:00 am and is weekend' do
      bedtime('1:00 am', true).must_equal(true)
    end
  end
end
