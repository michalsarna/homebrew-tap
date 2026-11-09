cask "basecreator" do
  arch arm: "arm64", intel: "x86_64"

  version "1.83.0"
  sha256 arm:   "8f468a6479b19ef15c0be46100e5f4ba520b486d71f47c6a357c58db645956ef",
         intel: "12972dec02023ab2fc5fbd7c346c48ce3caeee30c0db32839e669e06507c7598"

  url "https://github.com/michalsarna/baseCreator/releases/download/v#{version}/basecreator-v#{version}-macos-#{arch}.dmg"
  name "BaseCreator"
  desc "Drawing program that writes the project files of the Creator apps"
  homepage "https://github.com/michalsarna/baseCreator"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "BaseCreator.app"

  zap trash: "~/Library/Application Support/baseCreator/apps/basecreator"

  caveats <<~EOS
    BaseCreator is not notarized by Apple yet. If macOS refuses to open it the first time,
    right-click the app in Applications and choose Open, or run:
      xattr -dr com.apple.quarantine "#{appdir}/BaseCreator.app"
  EOS
end
