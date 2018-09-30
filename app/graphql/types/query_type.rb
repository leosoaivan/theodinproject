module Types
  class QueryType < Types::BaseObject
    description "The query root of this schema"

    # Course queries
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

    # Section queries
    field :section, SectionType, null: true do
      description "Find a section by ID"
      argument :id, ID, required: true
    end

    def section(id:)
      Section.find(id)
    end

    field :sections, [SectionType], null: true do
      description "Find all sections"
    end

    def sections
      Section.all
    end

    # Lesson queries
    field :lesson, LessonType, null: true do
      description "Find a lesson by ID"
      argument :id, ID, required: true
    end

    def lesson(id:)
      Lesson.find(id)
    end

    field :lessons, [LessonType], null: true do
      description "Find all lessons"
    end

    def lessons
      Lesson.all
    end
  end
end
