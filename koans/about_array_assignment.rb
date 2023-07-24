# frozen_string_literal: true

require 'neo'

# Parallell array assignment
# note: Parallell array assignment should be avoided. The usage is banned by default in rubocop
# and solargraph outright fails to parse it. These tests are kept in place to demonstrate
# the legacy usage.
class AboutArrayAssignment < Neo::Koan
  # rubocop:disable Style/ParallelAssignment
  def test_non_parallel_assignment
    names = %w[John Smith]
    assert_equal %w[John Smith], names
  end

  def test_parallel_assignments
    # @sg-ignore
    first_name, last_name = %w[John Smith]
    assert_equal 'John', first_name
    assert_equal 'Smith', last_name
  end

  def test_parallel_assignments_with_extra_values
    # @sg-ignore
    first_name, last_name = %w[John Smith III]
    assert_equal 'John', first_name
    assert_equal 'Smith', last_name
  end

  def test_parallel_assignments_with_splat_operator
    # @sg-ignore
    first_name, *last_name = %w[John Smith III]
    assert_equal 'John', first_name
    assert_equal %w[Smith III], last_name
  end

  def test_parallel_assignments_with_too_few_values
    # @sg-ignore
    first_name, last_name = ['Cher']
    assert_equal 'Cher', first_name
    assert_equal nil, last_name
  end

  def test_parallel_assignments_with_subarrays
    # @sg-ignore
    first_name, last_name = [%w[Willie Rae], 'Johnson']
    assert_equal %w[Willie Rae], first_name
    assert_equal 'Johnson', last_name
  end

  def test_parallel_assignment_with_one_variable
    # @sg-ignore
    first_name, = %w[John Smith]
    assert_equal 'John', first_name
  end

  def test_swapping_with_parallel_assignment
    first_name = 'Roy'
    last_name = 'Rob'
    # @sg-ignore
    first_name, last_name = last_name, first_name
    assert_equal 'Rob', first_name
    assert_equal 'Roy', last_name
  end
  # rubocop:enable Style/ParallelAssignment
end
