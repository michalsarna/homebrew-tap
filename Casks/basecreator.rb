cask "basecreator" do
  arch arm: "arm64", intel: "x86_64"

  version "1.92.1"
  sha256 arm:   "e133a2e6f4edd7cd6be08fc75fc94e91c089e1610bf8890c680aa51eccc6cfce",
         intel: "7f8d3ee997e190b8d65e2216031ab67d5730261f8e2ce78a503cb26c60d8daf2"

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
