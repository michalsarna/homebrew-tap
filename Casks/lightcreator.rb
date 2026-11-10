cask "lightcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.8.5"
  sha256 arm:   "c430f2d25daa3d9c6844bcf99f237f7f24691754c665fb51478aa168f2cc2b55",
         intel: "5d1f11b4b50861e08cc2799a6b8e945111efd39e2fe37854f59016b10099f825"

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
