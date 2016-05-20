require 'spec_helper'

describe Ultima::Util::Hinting do
  context 'methods' do
    before do
      stub_const 'Foo', Class.new

      Foo.class_eval do
        extend Ultima::Util::Hinting

        hint :a, String
        hint :b, Fixnum

        def initialize(a, b)
          @a = a
          @b = b
        end
        hint_method :initialize
      end
    end

    context '#hint' do
      it { expect(Foo.hinting[:a]).to eq(String) }
    end

    context '#hint_method' do
      pending
    end

    context '#new' do
      it { expect { Foo.new(1.5, 'foo').to_raise(ArgumentError) } }
    end
  end
end
