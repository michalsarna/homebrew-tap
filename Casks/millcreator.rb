cask "millcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.9.9"
  sha256 arm:   "4801d40b9a1cf37ee96ec9ec5073e121653891ae2095478ca1b7973aa92e3a7c",
         intel: "4ac257969780cf931d1318e17a5767afa56252495b184e9f732e36c8c61e06b5"

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
