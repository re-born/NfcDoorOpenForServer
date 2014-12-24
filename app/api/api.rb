class API < Grape::API
  prefix 'api'
  version 'v0', using: :path
  format :json
  rescue_from :all do |e|
    error_response({ message: e.message })
  end

  resource :user do
    get do
      user = User.find_by(idm: params[:idm])
    end
  end

  add_swagger_documentation api_version: 'v0'
end