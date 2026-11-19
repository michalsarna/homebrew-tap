cask "basecreator" do
  arch arm: "arm64", intel: "x86_64"

  version "2.7.3"
  sha256 arm:   "d839f05fa64b0a880840f114a52db3fb2f7e1cc53173a6250ffb04a1a510db9b",
         intel: "1e6ca6cd86720bb76a22cea57cd88ca15bb7e3e0c39a9deecd2b9657a1b2d32c"

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
