class PostsController < ApplicationController
  def index
    files = Dir.glob(File.join(Rails.root, "posts", "*.md"))
    @posts = files.map do |f|
      parsed = FrontMatterParser::Parser.parse_file(
        f,
        loader: FrontMatterParser::Loader::Yaml.new(allowlist_classes: [Date])
      )
      Post.new(f, parsed.front_matter)
    end
  end


  def show
    post_name = params[:id]

    content = File.read(File.join(Rails.root, "posts", "#{post_name}.md"))

    # Escape fences so that MiniRacer can evaluate:
    content = content.gsub(/`/, '\\\`')

    # Run from the dist entry point
    # New markdoc components aren't added for my blog
    # too frequently, but when they are we need to rebiuld
    # with `npm run build:markdoc`
    entry_point = File.read(File.join(Rails.root, "markdoc", "dist", "index.js"))

    # Render as markdoc
    context = MiniRacer::Context.new
    context.eval(entry_point)
    @rendered_content = context.eval("markdocRender(`#{content}`)")
  end
end
