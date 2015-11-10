module ServicesHelper
    def category_wrapper(service, categories)
        Category.find_by(name: "root").services << service
        unless(categories.nil?)
            categories.each do |category|
                cat = Category.find_by(name: category)
                cat.services << service
                category_parent_propagator(service, category)
            end
        end
    end
    
    def category_parent_propagator(service, category)
        parent = Category.find_by(name: category).supercategory
        unless(parent == "root")
            parent.services << service
            category_parent_propagator(service, parent)
        end
    end
end
