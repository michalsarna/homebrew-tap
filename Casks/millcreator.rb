cask "millcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.9.0"
  sha256 arm:   "cd6972b3253cae19089884295cb712c59f81a07005a7b559946e323caa4f98f1",
         intel: "9a3c682148af2f630fc9f02474da0028a4fc58e0e23a90295be6e546e7d2a354"

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
