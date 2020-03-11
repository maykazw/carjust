class ApplicationController < ActionController::API
  rescue_from ActionController::ParameterMissing do
    render(json: {:error=>"Parameter missing !"}.as_json, status: 400)
  end
end
