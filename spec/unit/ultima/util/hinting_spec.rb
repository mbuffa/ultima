require 'spec_helper'

describe Ultima::Util::Hinting do
  context 'methods' do
    before do
      stub_const 'Foo', Class.new

      Foo.class_eval do
        extend Ultima::Util::Hinting

        def initialize(a, b)
          @a = a
          @b = b
        end
        hint_method(:initialize, [String, Fixnum])
      end
    end

    context '#hint_method' do
      pending
    end

    context '#new' do
      it { expect { Foo.new('Hey', 5) }.not_to raise_error }
      it { expect { Foo.new(1.5, 'foo') }.to raise_error(ArgumentError) }
    end
  end
end
