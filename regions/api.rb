require 'json'
require 'net/http'

class CognitiveServices
  API_KEY = "29a8d21a1f2848f78e412d435d79c3e8"
  def initialize
    @uri = URI('https://southcentralus.api.cognitive.microsoft.com/vision/v1.0/ocr')
    @uri.query = URI.encode_www_form({
        # Request parameters
        'language' => 'unk',
        'detectOrientation ' => 'true'
    })
  end

  def text_recognition(image_url)
    request = Net::HTTP::Post.new(@uri.request_uri)
    # Request headers
    request['Content-Type'] = 'application/json'
    # Request headers
    request['Ocp-Apim-Subscription-Key'] = API_KEY
    # Request body
    request.body = "{ url: '#{image_url}'}"
    response = Net::HTTP.start(@uri.host, @uri.port, :use_ssl => @uri.scheme == 'https') do |http|
        http.request(request)
    end
    return JSON.parse(response.body)
  end
end