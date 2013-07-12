## Proc To Lambda

Convert your procs to lambdas for all the Rubies.

## Why?

I love anonomyous functions ( lambdas & procs <3 ). I also love "confident" style ruby functions that have early returns:

```ruby
def foo(num)
  return false if num.nil?
  # ...
```

Unfortunately procs do not play nice with early returns:

```ruby
def bar(num, &block)
  block.call(num)
end

bar(nil) do |num|
  return false if num.nil?
  # ...
end
LocalJumpError: unexpected return
  from (irb):25:in `block in irb_binding'
  from (irb):21:in `call'
  from (irb):21:in `bar'
  from (irb):24
  from /Users/schneems/.rbenv/versions/2.0.0-p247/bin/irb:12:in `<main>'
```

But lambdas do:

```ruby
bar(nil, &lambda {|num|
  return false if num.nil?
  # ...
})
# => false
```

What I want is the pretty syntax of using a proc, but with the flexibility of explicit returns of a lambda. Enter: ProcToLambda


## Can't you do this in Ruby already?

Yes, but the implementation is not standard across all the rubies :(

## Install

In your `Gemfile`:

```rb
gem 'proc_to_lambda'
```

## Use

In your code, call `ProcToLambda.to_lambda()` and pass in a block:

```ruby
def bar(num, &block)
  block = ProcToLambda.to_lambda(block)
  block.call(num)
end
```

If you're risky you can extend the `Proc` class directly:

```ruby
Proc.include(ProcToLambda)
```

Then you can call `Proc.to_lambda`:

```ruby
def bar(num, &block)
  block.to_lambda.call(num)
end
```

## License

MIT