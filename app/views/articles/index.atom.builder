atom_feed do |feed|
  feed.title = "PrimmerFamily.net Feed"
  @feed.each do |f|
    feed.updated f.updated_at
    return
  end

  @feed.each do |post|
    feed.entry post do |entry|
      entry.title post.article_header
      entry.content post.article_body
      entry.url article_path(post.article_id)
      entry.author do |author|
      author.name "Aaron Primmer"
      end
    end # end feed.entry
  end # end @posts.each
end