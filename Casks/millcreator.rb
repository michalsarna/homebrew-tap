cask "millcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.9.1"
  sha256 arm:   "627107b8ad5edf6dda41abacaf707a717b9fd5d17bd4cda75273c856f34cd473",
         intel: "b2b6441bea541c15171f7c5bcb0a05317c4def78c13716fef8776dd14fd38458"

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
