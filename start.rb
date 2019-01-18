# 2. Run a script that grabs the directory of assets, run them against the cognitive data service, grab text info and parse JSON text info into a searchable format.
require 'pg'
require 'json'
require 'rest-client'
require 'pry'

class CognitiveServices
  require 'net/http'
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

class DBPersistence
  def initialize
    @db = PG.connect(dbname: 'asset_library')
  end

  def query(sql, *params)
    puts "#{sql}, #{params}"
    @db.exec_params(sql, params)
  end

  def retrieve_assets
    sql = "SELECT id, url, uploaded_at, file_type FROM assets"
    result = query(sql)
    result.map do |tuple|
      { 
        id: tuple["id"],
        url: tuple["url"],
        uploaded_at: tuple["uploaded_at"],
        file_type: tuple["file_type"]
      }
    end
  end

  def update_asset_cognitive_data(id, metadata)
    sql = <<~SQL 
          UPDATE assets SET cognitive_text = $1
           WHERE id = $2
          SQL
    query(sql, metadata, id)
  end
end

class Annotation
  def initialize
    @db = DBPersistence.new
    @cognitive_service = CognitiveServices.new
  end

  def start
    assets = @db.retrieve_assets
    assets.each do |asset|
      response = @cognitive_service.text_recognition(asset[:url])
      cognitive_metadata = parse_cognitive_response(response)
      @db.update_asset_cognitive_data(asset[:id], cognitive_metadata)
    end
  end

  def parse_cognitive_response(response)
    cognitive_metadata = ""
    response["regions"].each do |region|
      region_text = ""
      region["lines"].each do |line|
        line["words"].each do |word|
          region_text += word["text"] + " "
        end
      end
      cognitive_metadata += region_text + " | "
    end
    cognitive_metadata
  end
end

Annotation.new.start

