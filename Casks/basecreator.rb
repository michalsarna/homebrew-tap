cask "basecreator" do
  arch arm: "arm64", intel: "x86_64"

  version "1.67.2"
  sha256 arm:   "9a9bad18e0b4fef2f412889e5e1a2fbc24e84cb9a8f8f1d213dd58bda7e73484",
         intel: "81e266417916aff77842b7fb40aebd92d8e09eb3d86c12fa28df62930e5a0019"

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
