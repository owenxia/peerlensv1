# == Schema Information
#
# Table name: annotations
#
#  id          :integer          not null, primary key
#  quote       :text
#  note        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  notebook_id :integer
#
# Indexes
#
#  index_annotations_on_notebook_id  (notebook_id)
#

require 'test_helper'

class AnnotationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
