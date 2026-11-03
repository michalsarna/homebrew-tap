cask "millcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.5.7"
  sha256 arm:   "2a281bde74cc07759dbefd57eef12efcadcd5bb9bb74578841e3954f1e966374",
         intel: "030c9d411a6199c4d75fca4da1e50422117affc29d6dfd47ad6004c25f9c0188"

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
