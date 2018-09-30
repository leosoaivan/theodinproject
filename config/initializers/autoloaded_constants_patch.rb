# config/initializers/autoloaded_constants_patch.rb
if Rails.env.development?
  # Work around a constant unloading issue, see: 
  # https://github.com/rails/rails/issues/31694
  # https://github.com/rmosolgo/graphql-ruby/issues/651
  # Use this modified Array class instead of Set 
  # because Set doesn't implement some methods 
  # required by ActiveSupport::Dependencies
  class UniqueArray < Array
    def <<(other)
      if include?(other)
        self
      else
        super(other)
      end
    end
  end
  ActiveSupport::Dependencies.autoloaded_constants = UniqueArray.new
end 