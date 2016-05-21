require 'spec_helper'

describe Ultima::Util::Abstract do
  context 'behavior' do
    before do
      stub_const 'Foo', Class.new
      stub_const 'Bar', Class.new(Foo)
      stub_const 'Baz', Class.new(Foo)

      Foo.class_eval do
        extend Ultima::Util::Abstract

        abstract_methods(:hey, :hoo)
      end

      Bar.class_eval do
        def hey
        end
      end

      Baz.class_eval do
        extend Ultima::Util::Abstract

        abstract_methods(:har)
      end
    end

    it { expect { Bar.new.hey }.not_to raise_error }
    it { expect { Bar.new.hoo }.to raise_error(NotImplementedError) }
    it { expect { Baz.new.har }.to raise_error(NotImplementedError) }
  end
end
