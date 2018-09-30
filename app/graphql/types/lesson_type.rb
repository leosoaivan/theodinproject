module Types
  class LessonType < Types::BaseObject
    description "A Lesson belonging to a Section and Course"

    field :id, ID, null: false
    field :url, String, null: true
    field :position, Int, null: false
    field :description, String, null: true
    field :is_project, Boolean, null: false
    field :title_url, String, null: true
    field :content, String, null: true
    field :slug, String, null: true
    field :repo, String, null: true

    field :course, CourseType, null: false,
      description: "The course this lesson belongs to"
      
    field :section, SectionType, null: false,
      description: "The section this lesson belongs to"
  end
end