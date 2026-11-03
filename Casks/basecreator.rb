cask "basecreator" do
  arch arm: "arm64", intel: "x86_64"

  version "1.65.0"
  sha256 arm:   "adbf209c5b4f7d262bd84f80184bc095e616cc24a6d7812a3eb8b21738b1051b",
         intel: "0228371b5dd14f6330c123989de7bb9e349519ad96cd6087bea68d07473d425a"

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
