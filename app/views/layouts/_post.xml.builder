post_time = post.created_at
post_time = Time.parse(post_time.to_s).rfc822 if post_time.is_a?(DateTime) #DateTime format doesn't support conversion to rfc822
xm.item do
  xm.title "#{h(post.respond_to?(:topic_title) ? post.topic_title : post.topic.title)}, #{h post.topic.sb_posts_count == 1 ? :posted.l : :replied.l } #{:by.l} #{h post.user.display_name} (#{post.created_at.ctime})"
  xm.description post.body_html
  xm.pubDate post_time
  xm.guid [request.host_with_port, post.forum_id.to_s, post.topic_id.to_s, post.id.to_s].join(":"), "isPermaLink" => "false"
  xm.author "#{post.user.display_name}"
  xm.link forum_topic_url(post.forum_id, post.topic_id)
end
