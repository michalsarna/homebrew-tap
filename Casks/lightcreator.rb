cask "lightcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.8.4"
  sha256 arm:   "69732acf886b45d948c7f7aee413294b45fd02276f4a2922d6e72afe5adb340c",
         intel: "f8c7503d586bd62a613109db2be75ca3d06dc74ad58f93d3c9342265ea2a7260"

  url "https://github.com/michalsarna/LightCreator/releases/download/v#{version}/lightcreator-v#{version}-macos-#{arch}.dmg"
  name "LightCreator"
  desc "Laser engraver and cutter design and control software"
  homepage "https://github.com/michalsarna/LightCreator"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "LightCreator.app"

  zap trash: "~/Library/Application Support/baseCreator/apps/lightcreator"

  caveats <<~EOS
    LightCreator is not notarized by Apple yet. If macOS refuses to open it the first time,
    right-click the app in Applications and choose Open, or run:
      xattr -dr com.apple.quarantine "#{appdir}/LightCreator.app"
  EOS
end
