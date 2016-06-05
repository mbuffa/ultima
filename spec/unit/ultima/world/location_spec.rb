require 'spec_helper'

describe Ultima::World::Location do
  context 'methods' do
    let(:a) { described_class.new(4, 5) }
    let(:b) { described_class.new(-3, 7) }
    let(:c) { [1, 2, 3] }
    let(:d) { %w(a b) }

    context '#new' do
      it do
        expect { described_class.new(*d) }.to raise_exception(ArgumentError)
      end
    end

    context '#+' do
      it { expect(a + b).to eq(described_class.new(1, 12)) }
      it { expect { a + c }.to raise_exception(ArgumentError) }
    end
  end
end
