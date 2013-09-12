require 'spec_helper'

describe Task do
  let(:task) { create(:task) }
  describe 'タスクが生成出来る' do
    subject { task }
    it { should be_instance_of Task }
  end
end
