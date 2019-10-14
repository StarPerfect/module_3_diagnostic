class SearchController < ApplicationController
  def index
    render locals: {
      facade: MemberFacade.new(house_params)
    }
  end

  private

  def house_params
    params.permit(:house)
  end
end
