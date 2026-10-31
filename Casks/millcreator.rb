cask "millcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.5.0"
  sha256 arm:   "70f55baccaf8b62265ce79052e4ee5f72c67eeee5420f4989795676177f67f58",
         intel: "ac398047b69a3cbb92f28f6d664bddf631bec960a1c0bd3fbdb46b6dd2e12538"

  url "https://github.com/michalsarna/MillCreator/releases/download/v#{version}/millcreator-v#{version}-macos-#{arch}.dmg"
  name "MillCreator"
  desc "CNC milling software with toolpaths, 3D view and G-code"
  homepage "https://github.com/michalsarna/MillCreator"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "MillCreator.app"

  zap trash: "~/Library/Application Support/baseCreator/apps/millcreator"

  caveats <<~EOS
    MillCreator is not notarized by Apple yet. If macOS refuses to open it the first time,
    right-click the app in Applications and choose Open, or run:
      xattr -dr com.apple.quarantine "#{appdir}/MillCreator.app"
  EOS
end
