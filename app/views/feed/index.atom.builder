atom_feed do |feed|
  feed.title "PrimmerFamily.net Feed"
  feed.updated @feed.first.updated_at

  @feed.each do |post|
    feed.entry(post, :url => article_path(post.article_id)) do |entry|
      entry.title post.article_header
      entry.content post.article_body
      entry.author do |author|
        author.name "Aaron Primmer"
      end
    end # end feed.entry
  end # end @posts.each
end