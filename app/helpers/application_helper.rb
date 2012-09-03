module ApplicationHelper
  def display_comment(post)
    like_text = post.liked_by_user?(current_user) ? "Unlike" : "Like"
    html =<<EOF
    <div class="post_wrapper">
      <div class="image">
        <img src="/images/avatar.jpg"/>
      </div>
      <div class="name">
        #{ link_to post.owner.username, user_path(post.owner.id) }
      </div>
      <div class="message">#{ post.message }</div>
      <div class="actions">
        <a href="#" id="like_button_#{post.id}" class="like_button" onclick="return false;" data-post-id="#{post.id}" data-like-value="#{post.liked_by_user?(current_user) ? '1' : '0'}">
        #{like_text}
        </a>
        #{link_to "Reply", ""}
      </div>
    </div>
EOF
    html.html_safe
  end
end
