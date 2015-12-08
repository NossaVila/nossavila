# -*- coding: utf-8 -*-
   
module NavigationHelpers
  def path_to(page_name)
    case page_name

    when /^the (NossaVilla )?home\s?page$/ then '/services'
    when /^the services page$/ then '/services'
    when /^the companies page$/ then '/companies'
    when /^the new company page$/ then 'companies/new'
    when /^the new user page$/ then '/users/sign_up'
    when /^the log in page$/ then '/users/sign_in'
    when /^the user dashboard page for "(.*)"$/ then user_path(User.find_by(:first_name => $1))
    when/^the Criar novo serviço page$/ then '/services/new'
    
    when/^the update user page$/ then '/users/edit'
    when/^the user sign in page$/ then '/users/sign_in'
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
