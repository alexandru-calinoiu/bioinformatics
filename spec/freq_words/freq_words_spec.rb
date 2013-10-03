require 'spec_helper'

describe FreqWords do
  subject { FreqWords.new(k, text).output }

  context 'when there is there is only 1 result' do
    let(:k) { 1 }
    let(:text) { 'A' }

    it { should == %w(A) }
  end

  context 'when there are 2 results and length 1' do
    let(:k) { 1 }
    let(:text) { 'AC' }

    it { should == %w(A C) }
  end

  context 'when there k is greater then 1' do
    let(:k) { 2 }
    let(:text) { 'AC' }

    it { should == %w(AC) }
  end

  context 'it should return the most frequent k-mers' do
    let(:k) { 2 }
    let(:text) { 'ACGTAC' }

    it { should == %w(AC) }
  end
end