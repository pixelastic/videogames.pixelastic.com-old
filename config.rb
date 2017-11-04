# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# Do not build partials
ignore '/partials/*'
ignore '/images/*/.git'

# Uncomment to debug builds, bypassing all image copy
# ignore '/images/*'

# Build a page for each game
data.index.each do |game_name|
  proxy "/#{game_name}.html",
        '/partials/game.html',
        locals: { game_name: game_name },
        ignore: true
end

configure :development do
  activate :livereload
end

# Helper methods
helpers do
  # Get all files from a directory
  def files_from_dir(path)
    return Dir[File.join(path, '*.{jpg,png,youtube}')].sort.map do |filepath|
      filepath.gsub('./source/', '')
    end
  end

  # Getting all files from a game
  def game_files(game)
    tabs = []
    game_path = "./source/images/#{game.slug}"
    game.tabs.each do |data|
      tabs.push(
        name: data.name,
        files: files_from_dir(File.join(game_path, data.path))
      )
    end
    tabs
  end

  # Thumbnail of the media
  def media_thumbnail(path)
    # Use a thumbnail in production, or the real image locally
    if image?(path)
      thumbnail = path
      thumbnail = cloudinary_thumbnail(thumbnail) if build?
      return thumbnail
    end

    # Use Youtube thumbnail if video
    id = youtube_id(path)
    "http://img.youtube.com/vi/#{id}/hqdefault.jpg"
  end

  # Link to the media to open in full page
  def media_link(path)
    # Use Cloudinary conversion when in production
    if image?(path)
      image = path
      image = cloudinary_image(image) if build?
      return image
    end

    # Use Youtube video
    id = youtube_id(path)
    "//www.youtube.com/watch?v=#{id}"
  end

  # Check if media is a video
  def video?(media)
    File.extname(media) == '.youtube'
  end

  # Check if the media is an image
  def image?(media)
    ['.jpg', '.png'].include?(File.extname(media))
  end

  # Read the file content to get the youtube id
  def youtube_id(path)
    File.open(File.join('./source', path), 'rb').read
  end

  # Cloudinary wrapper function
  def cloudinary(url, options)
    base_url = 'http://res.cloudinary.com/pixelastic-videogames/image/fetch/'
    "#{base_url}#{options.join(',')}/http://videogames.pixelastic.com#{url}"
  end

  # Resized thumbnailed through cloudinary
  def cloudinary_thumbnail(url)
    cloudinary(url, %w(h_200 q_90 c_scale f_auto))
  end

  # Resize image through cloudinary
  def cloudinary_image(url)
    cloudinary(url, %w(q_90 f_auto))
  end
end
