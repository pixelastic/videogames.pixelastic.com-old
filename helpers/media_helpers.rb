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
    "http://img.youtube.com/vi/#{id}/maxresdefault.jpg"
  end

  def media_link(name, section)
    return "/images/#{section.slug}/#{name}" if image?(name)
    id = youtube_id(name, section)
    "//www.youtube.com/embed/#{id}"
  end

  # def display_media(media, section)
  #   return display_image(media, section) if image?(media)
  #   return display_video(media, section) if video?(media)
  #   "UNKNOWN FORMAT #{media}"
  # end

  # def display_image(image, section)
  # end

  # def display_video(video, section)
  #   basename = File.basename(video, File.extname(video))
  #   youtube_id = section.youtube[basename]
  #   thumbnail = "http://img.youtube.com/vi/#{youtube_id}/hqdefault.jpg"
  #   tag('img', src: thumbnail)

  #   # content_tag(:iframe,
  #   #             nil,
  #   #             class: 'c-youtube',
  #   #             type: 'text/html',
  #   #             width: 640,
  #   #             height: 390,
  #   #             frameborder: 0,
  #   #             allowfullscreen: true,
  #   #             src: "//www.youtube.com/embed/#{youtube_id}"
  #   #            )
  # end

  # def display_media_card(item, section)
  #   %a.c-card{href: link}
  #     %div.c-card--image{style: "background-image:url(#{cover});"}
  #       -# =image_tag cover
  #     %div.c-card--name
  #       =section.name

  # end
end
