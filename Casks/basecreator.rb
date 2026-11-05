cask "basecreator" do
  arch arm: "arm64", intel: "x86_64"

  version "1.69.5"
  sha256 arm:   "2eaa0afc2301b5ebc77390c0ef2f49a1299901c00fd2eab3392deb53515337a6",
         intel: "4a979aa828ac391854368e50d31d851c10d7043951bed7a8b82c921cb2cd7141"

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
