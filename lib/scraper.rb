require "scraper/version"
require "nokogiri"
require "watir-webdriver"
require "headless"

module Scraper
  # https://www.hipmunk.com/flights#f=YVR;t=NYC;d=2015-03-06;r=2015-03-08
  @base = "https://www.hipmunk.com/flights#"

  def self.request(from_code:, to_code:, departing:, returning:, base_url: nil)
    base_url = base_url || @base
    url = "#{base_url}f=#{from_code};t=#{to_code};d=#{departing};r=#{returning}"

    headless = Headless.new
    headless.start
    browser = Watir::Browser.start url
    browser.div(:class => "flight-tab-group-info__price-bottom").wait_until_present(30)
    text = browser.div(:class => "flight-tab-group-info__price-bottom").text
    headless.destroy

    price = text.delete("^0-9")
    flight_data = {}
    flight_data[:price] = price
    flight_data[:deep_link] = url

    flight_data
  end

end
