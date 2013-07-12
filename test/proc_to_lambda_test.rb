require 'test_helper'

def pass_to_block(pass, &block)
  block.call(pass)
end

def pass_to_block_with_convert(pass, &block)
  block = ProcToLambda.to_lambda(block)
  pass_to_block(pass, &block)
end

def pass_to_block_with_include(pass, &block)
  pass_to_block(pass, block.to_lambda)
end

class ProcToLambdaTest < Test::Unit::TestCase
  def test_raises
    assert_raise do
      pass_to_block(nil) do |num|
        return false if num.nil?
      end
    end
  end

  def test_module_method_works
    pass_to_block_with_convert(nil) do |num|
      return false if num.nil?
    end
  end

  def test_include
    Proc.extend ProcToLambda
    pass_to_block(nil) do |num|
      return false if num.nil?
    end
    assert Proc.new.to_lambda
    Proc.send(:undef_method, :to_lambda)
  end
end
