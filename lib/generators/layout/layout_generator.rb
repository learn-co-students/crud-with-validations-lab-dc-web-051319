class LayoutGenerator < Rails::Generators::Base
  source_root File.expand_path('templates', __dir__)
  argument :layout_name, :type => :string, :default => "application"


  # def generate_layout
  #   # Name of the file in the generators/layout/templates directory
  #   copy_file "stylesheet.css",
  #   # Destination path
  #    "public/stylesheets/#{layout_name.underscore}.css"
  # end

  def generate_routes
    # Name of the file in the generators/layout/templates directory
    template "routes.template",
    # Destination path
    "config/routes.rb"
  end

  def generate_application_controller
    copy_file "application_controller.rb",
    "app/controllers/application_controller.rb"
  end

  def generate_controller
    template "template_controller.template",
    "app/controllers/#{file_name}_controller.rb"
  end

  def generate_model
    template "template_model.template",
    "app/models/#{file_name}.rb"
  end

  def generate_views
    template "index_view.template", "app/views/#{file_name}/index.html.erb"
    template "edit_view.template", "app/views/#{file_name}/edit.html.erb"
    template "new_view.template", "app/views/#{file_name}/new.html.erb"
    template "show_view.template", "app/views/#{file_name}/show.html.erb"
  end


  private
  def file_name
    #Formats the file name to be called out throughout code
    layout_name.underscore
  end



  # To call command, in terminal - rails generate layout [LAYOUT_NAME]
end
