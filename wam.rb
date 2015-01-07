clientid = '173268a5' 
clientsecret = '7444180d91b9b59000e429e57357a816' 
host = 'api.cloudpassage.com'
my_proxy = nil

require 'oauth2' 
require 'rest-client' 
require 'json' 

if ENV['https_proxy'].to_s.length > 0
  my_proxy = ENV['https_proxy']
  RestClient.proxy = my_proxy
  $stderr.puts "Using proxy: #{RestClient.proxy}" 
end

#queryurl ='/v1/fim_policies/be64cab06fdf0132a4ba3c764e10c221/baselines/cd20d5406fdf0132fe6f3c764e10c220/details'

client = OAuth2::Client.new(clientid, clientsecret,
        :connection_opts => { :proxy => my_proxy }, 
        :site => "https://#{host}", 
        :token_url => '/oauth/access_token'
) 
token = client.client_credentials.get_token.token

result = RestClient.get "https://#{host}/v1/servers", {
        'Authorization' => "Bearer #{token}"
}

data = JSON result.body
servers = data['servers']
servers.each do |server|
        puts server['connecting_ip_address'] + " " + server['hostname']
        #puts server['hostname']
end
