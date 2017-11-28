module ApplicationHelper

  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, fenced_code_blocks: true, disable_indented_code_blocks: true, space_after_headers: true)
    return markdown.render(text).html_safe
  end

end
