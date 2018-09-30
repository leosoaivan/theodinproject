module Types
  class CourseType < Types::BaseObject
    description "A Course"

    field :id, ID, null: false
    field :title, String, null: true
    field :description, String, null: true
    field :title_url, String, null: true
    field :position, Int, null: false
    field :slug, String, null: true

    field :sections, [SectionType], null: true,
      description: "This course's sections"

    field :lessons, [LessonType], null: true,
      description: "This course's lessons"
  end
end
