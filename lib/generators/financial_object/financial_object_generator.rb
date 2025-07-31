class FinancialObjectGenerator < Rails::Generators::NamedBase
  include Rails::Generators::ResourceHelpers

  source_root File.expand_path("templates", __dir__)

  desc "Generates a new financial object"

  argument :base, type: :string, banner: "[asset|liability|income|expense] "
  argument :attributes, type: :array, default: [],
           banner: "field:type field:type ..."

  def create_scaffold
    generate :model, name, attributes
    if behavior == :invoke
      rails_command "db:migrate"
      generate "object_view:scaffold", name
    elsif behavior == :revoke
      rails_command "db:rollback"
      generate "object_view:scaffold", name
    end
  end

  def update_model
    template "model.rb", Rails.root.join("app/models/#{name}.rb")
    gsub_file "app/models/#{base}.rb",
              /(types: %w\[)([^\]]+)/ do |m|
      h, list = m.split("[")
      "#{h}[ #{_combine(list, name.camelize)} "
    end
  end

  def update_controller
    gsub_file "app/controllers/#{name.pluralize}_controller.rb",
              /#{base.pluralize}_attributes.*/, ""
    gsub_file "app/controllers/#{name.pluralize}_controller.rb",
              /def self.#{name}_params/, <<~EOS
   # params
     def self.#{name}_params
       [
          *base_params,
          #{base}_attributes: [#{base.capitalize.pluralize}Controller.base_params]
       ]
      end
      def self.base_params
    EOS
  end

  def create_able
    # Model file changes need to be in place
    load "app/models/#{name}.rb"
    template "able.html.erb",
             Rails.root.join("app/views/#{name.pluralize}/_#{base}able.html.erb")
  end

  def update_model_spec
    gsub_file "spec/models/#{name}_spec.rb",
              /^end/, "  save_dt_from_params\nend"
  end

  def update_factory
    gsub_file "spec/factories/#{name.pluralize}.rb",
              /^    end/, <<~EOS
        end
          after :build do |obj|
            obj.#{base} = build(:#{base}_super)
          end
    EOS
  end

  def update_features_spec
    gsub_file "spec/features/#{name.pluralize}_spec.rb",
              /  pending/, "  # pending"
    gsub_file "spec/system/#{name.pluralize}_spec.rb",
              /  pending/, "  # pending"
  end

  def update_requests_spec
    gsub_file "spec/requests/#{name.pluralize}_spec.rb",
              /user: :admin_user/,
              "user: :person_user, user_path: :switch_user_path"
    gsub_file "spec/requests/#{name.pluralize}_spec.rb",
              /skip/, "# skip"
    gsub_file "spec/requests/#{name.pluralize}_spec.rb",
              /# build\(:#{name}\)/, "build(:#{name}_sample)"
    gsub_file "spec/requests/#{name.pluralize}_spec.rb",
              /build\(:#{name}_sample\).to_params ssn: .*/,
              "build(:#{name}_sample).to_params #{attributes.first.name}: -1"
    gsub_file "spec/requests/#{name.pluralize}_spec.rb",
              /# build\(:#{name}_sample\).to_params.slice.*/,
              "build(:#{name}_sample).to_params.slice(*%i[#{attributes.map(&:name).join(' ')} ])"
  end

  def update_views_spec
    %w[edit new show].each do |action|
    gsub_file "spec/views/#{name.pluralize}/#{action}.html.erb_spec.rb",
              /user: :admin_user/,
              "user: :person_user, user_path: :switch_user_path"
    end
  end

  private

  def _combine list, value
    list.split.union([value]).join " "
  end
end
