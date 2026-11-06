cask "basecreator" do
  arch arm: "arm64", intel: "x86_64"

  version "1.74.0"
  sha256 arm:   "14625ad1f22adebfcea269dc42092b1ceed6f9307bd166c5bf386b75731c15aa",
         intel: "788141e35a934059aad8e3773a7306af9e1cd5945fbbaec9befb0371c8595258"

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
