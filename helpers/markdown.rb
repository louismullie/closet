def markdown(text, args = {})
  
  args = {
     filter_html: false,
     autolink: true,
     syntax_highlighting: false
   }.merge(args)

   copy = text.dup

   # This is sketchy and needs fixing.
   if args[:syntax_highlighting]
     file.scan(/```([a-z]+)(.*?)```/m).each do |lang, block|
       copy.gsub!(Regexp.last_match.to_s, 
       CodeRay.scan(block, lang.intern).div)
     end
   end
   
   type = Redcarpet::Render::HTML
   engine = Redcarpet::Markdown.new(renderer, args)
   engine.render(text)
  
end