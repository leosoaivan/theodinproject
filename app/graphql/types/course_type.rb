module Types
  class CourseType < Types::BaseObject
    description "A TOP course"

    field :id, ID, null: true
    field :description, String, null: true
    field :title_url, String, null: true
    field :position, Int, null: false
    field :slug, String, null: true

    field :course, CourseType, null: true do
      description "Find a course by ID"
      argument :id, ID, required: true
    end

    def course(id:)
      Course.find(id)
    end

    field :courses, [CourseType], null: true do
      description "Find all courses"
    end

    def courses
      Course.all
    end
  end
end