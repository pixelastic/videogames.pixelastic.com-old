module MediaHelpers
  def video?(media)
    File.extname(media) == '.mp4'
  end

  def image?(media)
    File.extname(media) == '.jpg'
  end

  def youtube_id(video, section)
    basename = File.basename(video, File.extname(video))
    section.youtube[basename]
  end

  def media_thumbnail(name, section)
    return "/images/#{section.slug}/#{name}" if image?(name)
    id = youtube_id(name, section)
    "http://img.youtube.com/vi/#{id}/hqdefault.jpg"
  end

  def media_link(name, section)
    return "/images/#{section.slug}/#{name}" if image?(name)
    id = youtube_id(name, section)
    "//www.youtube.com/watch?v=#{id}"
  end
end
