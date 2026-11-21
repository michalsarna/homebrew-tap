cask "basecreator" do
  arch arm: "arm64", intel: "x86_64"

  version "2.7.6"
  sha256 arm:   "2418fc82484dc3134aeb3d937a3c3e73f28c56f6c514db5b1684f2b457a461a4",
         intel: "c1d8dcb1ff149881d39564fe680d558d78204d13e8fc83032510256830777318"

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
