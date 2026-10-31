cask "millcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.5.1"
  sha256 arm:   "7cb22c88e750bb9d496cd3451319a8a9780487f779e8f006e4598f387edf342c",
         intel: "84a8d760390f159d5dc165c945b79d624ca374a6a247a500ee4df866165242f4"

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
