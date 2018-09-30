class TheodinprojectSchema < GraphQL::Schema
  # mutation(Types::MutationType)
  query(Types::QueryType)
  query(Types::CourseType)
end
