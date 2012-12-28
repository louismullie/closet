def markdown(text, args = {})

  require 'redcarpet'

  args = {filter_html: false,
  autolink: true}.merge(args)

  # This is sketchy and needs fixing.
  copy = text.dup
  text.scan(/```([a-z]+)(.*?)```/m).each do |lang, block|
    copy.gsub!(Regexp.last_match.to_s,
    CodeRay.scan(block, lang.intern).div)
  end
  # End of sketchiness.

  type = Redcarpet::Render::HTML
  engine = Redcarpet::Markdown.new(type, args)
  engine.render(copy)

end
