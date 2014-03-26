def strip_tags(html)     
  return html if html.blank?
  if html.index("<")
    text = ""
    tokenizer = HTML::Tokenizer.new(html)

    while token = tokenizer.next
      node = HTML::Node.parse(nil, 0, 0, token, false)
      # result is only the content of any Text nodes
      text << node.to_s if node.class == HTML::Text  
    end
    # strip any comments, and if they have a newline at the end (ie. line with
    # only a comment) strip that too
    text.gsub(/<!--(.*?)-->[\n]?/m, "") 
  else
    html # already plain text
  end 
end