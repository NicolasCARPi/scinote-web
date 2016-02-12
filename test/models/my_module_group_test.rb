require 'test_helper'
require 'helpers/searchable_model_test_helper'

class MyModuleGroupTest < ActiveSupport::TestCase
  include SearchableModelTestHelper

  def setup
    @module_group = my_module_groups(:wf1)
  end

  test "should validate with valid data" do
    assert @module_group.valid?
  end

  test "should not validate with name" do
    @module_group.name = ""
    assert_not @module_group.valid?
    @module_group.name = nil
    assert_not @module_group.valid?
  end

  test "should not validate too long name" do
    @module_group.name = "n" * 51
    assert_not @module_group.valid?
  end

  test "where_attributes_like should work" do
    attributes_like_test(MyModuleGroup, :name, "expression")
  end
end
