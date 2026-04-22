module Jekyll
    class CategoryPageGenerator < Generator
      safe true
  
      def generate(site)
        site.categories.each do |category, posts|
          # Create a new page for each category
          site.pages << CategoryPage.new(site, site.source, category, posts)
        end
      end
    end
  
    # Define the category page
    class CategoryPage < Page
      def initialize(site, base, category, posts)
        @site = site
        @base = base
        @dir = "categories/#{category}" # Directory for the category page
        @name = "index.html" # File name for the category page
  
        self.process(@name)
        self.read_yaml(File.join(base, "_layouts"), "category.html") # Use a layout file
        self.data["category"] = category
        self.data["title"] = "Posts in \"#{category}\""
        self.data["posts"] = posts
      end
    end
  end