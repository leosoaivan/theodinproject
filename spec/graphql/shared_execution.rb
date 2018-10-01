RSpec.configure do |rspec|
  # This config option will be enabled by default on RSpec 4,
  # but for reasons of backwards compatibility, you have to
  # set it on RSpec 3.
  #
  # It causes the host group and examples to inherit metadata
  # from the shared context.
  rspec.shared_context_metadata_behavior = :apply_to_host_groups
end

RSpec.shared_context "shared execution", :shared_context => :metadata do
  let(:context)     { {} }
  let(:variables)   { {} }
  let(:root_value)  { {} }
  let(:result)      {
    res = TheodinprojectSchema.execute(
      query_string,
      context: context,
      variables: variables,
      root_value: root_value
    )
    # Print any errors
    if res["errors"]
      pp res
    end
    res
  }
end

RSpec.configure do |rspec|
  rspec.include_context "shared execution", :include_shared => true
end
