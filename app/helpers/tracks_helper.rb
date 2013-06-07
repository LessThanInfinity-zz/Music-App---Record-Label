#encoding: utf-8
module TracksHelper

  def gay_lyrics(text_block)
    html = "</p>"
    lyric_lines = text_block.split("\n")
    lyric_lines.each do |line|
      html += "♫    "
      html += line
      html += '<br>'
    end

    html.html_safe
  end
end
