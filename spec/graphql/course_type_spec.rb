require 'rails_helper'
require 'graphql/shared_execution.rb'

RSpec.describe Types::CourseType do
  include_context 'shared execution'

  let!(:course1) { Course.create(position: 1) }
  let!(:course2) { Course.create(position: 2) }

  describe 'course(id:)' do
    let(:query_string) {
      %(
        {
          course(id: "#{course1.id}") {
            id
          }
        }
      )
    }

    it 'returns a course by ID' do
      expect(result['data'].deep_symbolize_keys).to eq(
        course: {
          id: "#{course1.id}"
        }
      )
    end
  end      

  describe 'courses' do
    let(:query_string) {
      %(
        {
          courses {
            id
          }
        }
      )
    }

    it 'returns all courses' do
      expect(result['data'].deep_symbolize_keys).to eq(
        courses: [
          {
            id: "#{course1.id}"
          },
          {
            id: "#{course2.id}"
          }
        ]
      )
    end
  end      

  describe 'sections' do
    let(:query_string) {
      %(
        {
          course(id: "#{course1.id}") {
            sections {
              id
            }
          }
        }
      )
    }

    it 'returns all of a course\'s sections' do
      section1 = course1.sections.create(position: 1)
      section2 = course1.sections.create(position: 2)
      section3 = course2.sections.create(position: 3)

      expect(result['data'].deep_symbolize_keys).to eq(
        course: {
          sections: [
            {
              id: "#{section1.id}"
            },
            {
              id: "#{section2.id}"
            }
          ]
        }
      )
    end
  end

  describe 'lessons' do
    let(:query_string) {
      %(
        {
          course(id: "#{course1.id}") {
            lessons {
              id
            }
          }
        }
      )
    }

    it 'returns all of a course\'s lessons' do
      section1 = course1.sections.create(position: 1)
      section2 = course2.sections.create(position: 2)
      lesson1 = section1.lessons.create(position: 1)
      lesson2 = section2.lessons.create(position: 2)

      expect(result['data'].deep_symbolize_keys).to eq(
        course: {
          lessons: [
            {
              id: "#{lesson1.id}"
            }
          ]
        }
      )
    end
  end
end
