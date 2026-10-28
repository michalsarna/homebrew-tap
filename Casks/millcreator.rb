cask "millcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.4.0"
  sha256 arm:   "b2940c4b0243ce297103f72da58377cf9749d2916b93202c9b0b6ea9b5d86b58",
         intel: "4d0ed1c668294f995bc4e4eb700ee39455a361ea82222dcdc7c7e5ecb34c4366"

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
