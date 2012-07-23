def markdown(template, args = {})
  
  args = {
     :filter_html => false,
     :autolink => true,
     :fenced_code_blocks => true,
   }.merge(args)

   file = File.read("./content/#{template}.md")
   copy = file.dup

   file.scan(/```([a-z]+)(.*?)```/m).each do |lang, block|
     copy.gsub!(Regexp.last_match.to_s, 
     CodeRay.scan(block, lang.intern).div)
   end
   
   Redcarpet::Markdown.new(
   Redcarpet::Render::HTML, args).
   render(copy)
  
end