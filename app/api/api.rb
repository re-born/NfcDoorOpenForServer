class API < Grape::API
  prefix 'api'
  version 'v0', using: :path
  format :json
  rescue_from :all do |e|
    error_response({ message: e.message })
  end

  resource :user do
    get do
      if user = User.find_by(idm: params[:idm])
        user
      else
        {error: "user cannot find with idm: #{params[:idm]}"}
      end
    end

    post do
      user = User.new(idm: params[:idm], name: params[:name])
      if user.save
        user
      else
        {error: "user cannot create with some reason."}
      end
    end
  end

  add_swagger_documentation api_version: 'v0'
end