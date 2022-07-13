class Post
  def initialize(filename, front_matter)
    @filename = filename
    @front_matter = front_matter
  end

  def title
    @front_matter['title']
  end

  def date
    @front_matter['date']
  end

  def id
    file = @filename.split("/").last
    File.basename(file,File.extname(file))
  end
end

