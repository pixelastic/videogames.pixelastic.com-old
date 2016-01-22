module MediaHelpers
  def video?(media)
    File.extname(media) == '.mp4'
  end

  def image?(media)
    File.extname(media) == '.jpg'
  end

  def display_media(media, section)
    return display_image(media, section) if image?(media)
    return display_video(media, section) if video?(media)
    "UNKNOWN FORMAT #{media}"
  end

  def display_image(image, section)
    path = "/images/#{section.slug}/#{image}"
    tag('img', src: path)
  end

  def display_video(video, section)
    basename = File.basename(video, File.extname(video))
    youtube_id = section.youtube[basename]
    thumbnail = "http://img.youtube.com/vi/#{youtube_id}/hqdefault.jpg"
    tag('img', src: thumbnail)

    # content_tag(:iframe,
    #             nil,
    #             class: 'c-youtube',
    #             type: 'text/html',
    #             width: 640,
    #             height: 390,
    #             frameborder: 0,
    #             allowfullscreen: true,
    #             src: "//www.youtube.com/embed/#{youtube_id}"
    #            )
  end
end
