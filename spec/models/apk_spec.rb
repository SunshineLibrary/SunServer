require 'spec_helper'

describe Apk do
  describe "creating an apk" do
    it "can be hard destroyed" do
      apk = Apk.create
      apk.should_not be_nil
      apk.destroy
      Apk.first.should be_nil
    end
  end
end
