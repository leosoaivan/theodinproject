module Types
  class SectionType < Types::BaseObject
    description "A Section belonging to a Course"

    field :id, ID, null: false
    field :title, String, null: true
    field :position, Int, null: false
    field :title_url, String, null: true
    field :description, String, null: true

    field :course, CourseType, null: false,
      description: "The course this section belongs to"

    field :lessons, [LessonType], null: false,
      description: "This section's lessons"
  end
end