cask "millcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.9.3"
  sha256 arm:   "3f7f3dbacf4cbc1afe0e76768b650db10c8f80bcb712a207a5884ee555cc10f2",
         intel: "26e9f330fd5fd780c9a91639848d5db26fe71b42f9dc03744c23c1394d59fcb9"

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
