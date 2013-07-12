module ProcToLambda
  def to_lambda
    ProcToLambda.to_lambda(self)
  end

  def self.to_lambda(block)
    if RUBY_ENGINE && RUBY_ENGINE == "jruby"
      return lambda(&block)
    else
      # Grossssss, don't use
      obj = Object.new
      obj.define_singleton_method(:_, &block)
      return obj.method(:_).to_proc
    end
  end
end
