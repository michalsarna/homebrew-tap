cask "basecreator" do
  arch arm: "arm64", intel: "x86_64"

  version "2.4.0"
  sha256 arm:   "ace67cf2152f90c1fc8e5f48408012e1b24408fcb797dc41d3db044919fe4568",
         intel: "ee238abe1bc7d351fcf76df1114a6bb96ea6e9d5f892cff4f1f9bc5099ac38f3"

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
