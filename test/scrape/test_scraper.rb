require './test/test_helper'

class ScraperTest < Minitest::Test

  def test_exists
    assert Scraper
  end

  def test_scrapes_element
    # https://www.hipmunk.com/flights#f=YVR;t=NYC;d=2015-03-06;r=2015-03-08
    from_code = "YVR"
    to_code = "NYC"
    departing = "2015-03-06"
    returning = "2015-03-08"
    res = Scraper.request(from_code: from_code, to_code: to_code, departing: departing, returning: returning)
    print res
  end

end
