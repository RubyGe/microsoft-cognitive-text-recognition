require 'fastimage'
require 'net/http'

require_relative 'api'

class DrawingSections

  def initialize(url)
    @url = url
    @sections = CognitiveServices.new.text_recognition(@url)
    File.open("response.json", "w+") do |file|
      file << @sections
    end
  end

  def start
    # get image url
    html_header
    width, height = FastImage.size(@url)
    generate_css(@url, width, height)
    draw_shits(@sections)
    html_footer
  end

  def html_header
    File.open("drawing.html", "w+") do |file|
      file << <<~HTML
                  <!DOCTYPE html>
                  <html lang="en-US">
                  <head>
                    <title>Regions Drawing</title>
                    <meta charset="UTF-8" />
                    <link rel="stylesheet" href="style.css" />
                  </head>
                  <body>
               HTML
    end
  end

  def generate_css(url, width, height)
    File.open("style.css", "w+") do |file|
      file << <<~CSS
                * {
                  box-sizing: border-box;
                }

                .region,
                .line,
                .word {
                  display: block;
                  position: absolute;
                }

                .line:hover {
                  z-index: 1000;
                }

                .region {
                  border: 5px red solid;
                }

                .line {
                  border: 3px blue solid;
                }

                .word {
                  border: 1px yellow solid;
                }

              CSS
      file << <<~BODY
                 body {
                    background: url('#{url}') no-repeat;
                    width: #{width}px;
                    height: #{height}px;
                 }
                BODY
    end
  end

  def html_footer
    File.open("drawing.html", "ab") do |file|
      file << <<~HTML
                </body>
                </html>
               HTML
    end
  end

  def draw_rectangle(coordinates, type)
    "<div class=\"#{type}\" style=\"left: #{coordinates[0]}px; top: #{coordinates[1]}px; width: #{coordinates[2]}px; height: #{coordinates[3]}px;\"></div> \n"
  end

  def get_coordinates(section)
    section["boundingBox"].split(",")
  end

  def draw_shits(sections)
    body = ""
    sections["regions"].each do |region|
      body << draw_rectangle(get_coordinates(region), "region")
      region["lines"].each do |line|
        body << draw_rectangle(get_coordinates(line), "line")
        line["words"].each do |word|
          body << draw_rectangle(get_coordinates(word), "word")
        end
      end
    end

    File.open("drawing.html", "ab") do |file|
      file << body
    end
  end
end

DrawingSections.new(ARGV[0]).start
