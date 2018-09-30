require 'rails_helper'
require 'graphql/shared_execution.rb'

RSpec.describe Types::CourseType do
  include_context 'shared execution'

  let(:course1) { Course.create(position: 1) }
  let(:course2) { Course.create(position: 2) }

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
              id: "#{section1.id}", position: section1.position
            },
            {
              id: "#{section2.id}", position: section2.position
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