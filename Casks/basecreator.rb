cask "basecreator" do
  arch arm: "arm64", intel: "x86_64"

  version "1.77.0"
  sha256 arm:   "1ea4da85dacfdfd28385c9b04e457c9332b05687c12a89d6311cb01eed8b02a6",
         intel: "bf6593482c525631deb0e33033dd06e58f9c7fe5645cc873b21da077cbcae843"

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
