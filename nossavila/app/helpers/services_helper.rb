module ServicesHelper
    def category_wrapper(service, categories)
        root = Category.find_by(name: "root")
        root.services << service
        unless(categories.nil?)
            categories.each do |category|
                cat = Category.find_by(name: category)
                cat.services << service
                category_parent_propagator(service, cat, root)
            end
        end
    end
    
    def category_parent_propagator(service, category, root)
        parent = Category.find_by(name: category.name).supercategory
        unless(parent == root || parent.nil?)
            parent.services << service
            category_parent_propagator(service, parent, root)
        end
    end

    def alpha_numeric_only(string)
      return string.gsub(/[^0-9a-z]/i, '')
    end
end
