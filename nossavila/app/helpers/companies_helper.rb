module CompaniesHelper
    def category_wrapper_comp(company, categories)
        root = Category.find_by(name: "root")
        root.companies << company
        unless(categories.nil?)
            categories.each do |category|
                cat = Category.find_by(name: category)
                cat.companies << company
                category_parent_propagator_comp(company, cat, root)
            end
        end
    end
    
    def category_parent_propagator_comp(company, category, root)
        parent = Category.find_by(name: category.name).supercategory
        unless(parent == root || parent.nil?)
            parent.companies << company
            category_parent_propagator_comp(company, parent, root)
        end
    end
end
    