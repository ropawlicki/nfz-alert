class BenefitsController < ApplicationController

  def fetch
    response = HTTParty.get('https://api.nfz.gov.pl/app-itl-api/benefits?limit=25')
    p response.body
  end

end