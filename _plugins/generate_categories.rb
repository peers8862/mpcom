module Jekyll
  class CategoryPageGenerator < Generator
    safe true
    priority :low

    def generate(site)
      site.categories.each do |category, posts|
        # Safely create a URL-friendly slug (handles spaces, capitals, special chars)
        slug = Jekyll::Utils.slugify(category.to_s)

        site.pages << CategoryPage.new(site, site.source, category, slug, posts)
      end
    end
  end

  class CategoryPage < Page
    def initialize(site, base, category, slug, posts)
      @site = site
      @base = base
      @dir  = "categories/#{slug}"
      @name = "index.html"

      self.process(@name)
      self.read_yaml(File.join(base, "_layouts"), "category.html")

      self.data["category"] = category          # original name for display
      self.data["title"]    = "Posts in \"#{category}\""
      self.data["posts"]    = posts.sort_by { |p| -p.date.to_i }  # newest first
    end
  end
end