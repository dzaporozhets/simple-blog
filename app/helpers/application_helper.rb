module ApplicationHelper
  def current_user_gravatar(size = 24)
    gravatar_path(current_user.email, size)
  end

  def gravatar_path(user_email, size = 24)
    gravatar_prefix = request.ssl? ? "https://secure" : "http://www"
    user_email.strip!
    "#{gravatar_prefix}.gravatar.com/avatar/#{Digest::MD5.hexdigest(user_email.downcase)}?s=#{size}&d=identicon"
  end

  def markdown text
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                            :autolink => true, :space_after_headers => true)

    @markdown.render(text).html_safe
  end
end
