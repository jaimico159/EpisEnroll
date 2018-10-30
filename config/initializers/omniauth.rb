OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '33461218919-0q21asp41ulo30pt2g01mauqic9fl27r.apps.googleusercontent.com', 'fr79jeyX54TuQEuT6ZLZMoMF', skip_jwt: true
#,{client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}


end													 
