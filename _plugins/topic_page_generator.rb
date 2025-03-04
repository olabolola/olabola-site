module Jekyll
  class TopicPageGenerator < Generator
    safe true

    def generate(site)
      topics = Set.new
      
      # Collect all topics from labels
      site.collections['notes'].docs.each do |note|
        if note.data['labels']
          note.data['labels'].each do |label|
            # Extract topic name from [Topic](Topic) format
            if label =~ /\[(.*?)\]/
              topic = $1
              topics.add(topic)
            end
          end
        end
      end

      # Generate a page for each topic
      topics.each do |topic|
        site.pages << TopicPage.new(site, site.source, topic)
      end
    end
  end

  class TopicPage < Page
    def initialize(site, base, topic)
      @site = site
      @base = base
      @dir = 'topics'
      @name = "#{Jekyll::Utils.slugify(topic)}.md"

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'topic.html')
      
      self.data['title'] = "Topic: #{topic}"
      self.data['topic'] = topic
    end
  end
end 