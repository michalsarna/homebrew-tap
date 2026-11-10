cask "basecreator" do
  arch arm: "arm64", intel: "x86_64"

  version "1.85.0"
  sha256 arm:   "3d6064ca074837f0075301edc0f539eb98f6c8bd34c3ba4e0074f8bc67c7d78d",
         intel: "ee9e96c0df2838f7107ba9032e866f1ba9ca41e5672ae3c9e189bfa7d406f096"

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
