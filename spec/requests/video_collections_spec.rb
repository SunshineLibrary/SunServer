require 'spec_helper'

describe "VideoCollections" do
  describe "GET /video_collections" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get video_collections_path
      response.status.should be(200)
    end
  end
end
