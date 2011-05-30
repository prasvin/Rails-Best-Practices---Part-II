module PostsHelper

  def  show_popular_post(post)
    content_tag :h4 do
      raw
      (
        content_tag :h4, 'link_to "#{post.title} (#{post.comments.length})", user_post_path(post)' +
        post.text
      )
  end

end
