xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "sambragg.co.uk"
    xml.description "Latest news from sambragg.co.uk"
    xml.link blogs_url

    for blog in @all_blogs
      xml.item do
        xml.title blog.title
        xml.description blog.content
        xml.pubDate blog.created_at.to_s(:rfc822)
        xml.link blog_url(blog)
        xml.guid blog_url(blog)
      end
    end
  end
end