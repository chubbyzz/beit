require 'open-uri'

module ApplicationHelper
  def get_json_from_uri(uri, params = {})
    response = Net::HTTP.post_form(URI(uri), params)
    JSON.parse response.body
  end
end
