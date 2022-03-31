module ApplicationHelper
  include Pagy::Frontend
  class HTMLWithPants < Redcarpet::Render::HTML
    include Redcarpet::Render::SmartyPants
  end

  def markdown
    @markdown ||= Redcarpet::Markdown.new(HTMLWithPants.new(hard_wrap: true, prettify: true))
  end
end
