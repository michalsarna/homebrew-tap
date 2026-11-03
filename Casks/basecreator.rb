cask "basecreator" do
  arch arm: "arm64", intel: "x86_64"

  version "1.63.0"
  sha256 arm:   "06e301f3a0ff48c0ec8ae19428d1995fb04ed02e1b6cdc331d237dcd4e7a853c",
         intel: "6497e91986a6f179a387f433c75e74d129e74955b531a2c6af505634a461cddb"

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
