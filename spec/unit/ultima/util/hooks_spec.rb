require 'spec_helper'

describe Ultima::Util::Hooks do
  context 'methods' do
    before do
      stub_const 'Foo', Class.new

      Foo.class_eval do
        include Ultima::Util::Hooks

        before [:a, :b] { print 1 }

        # FIXME: Find out why the short form '{ }' conflicts with RSpec.
        after :a do
          print 2
        end

        before :b, do: :c

        def a
          print 'a'
        end

        def b
          print 'b'
        end

        def c
          print 3
        end
      end
    end

    context '#before' do
      pending
    end

    context '#after' do
      pending
    end

    context '#a' do
      it { expect { Foo.new.a }.to output('1a2').to_stdout }
    end

    context '#b' do
      it { expect { Foo.new.b }.to output('31b').to_stdout }
    end
  end
end
