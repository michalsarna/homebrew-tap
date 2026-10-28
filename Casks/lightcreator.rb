cask "lightcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.3.8"
  sha256 arm:   "af6cd6303a71e2793e3eccf93a7c8db2588b6f704251bcd5e8e05adb1dce0c59",
         intel: "6ff2ce28ebce11407cbfe4ae3ceed827f4157babb446ff96be1a05b2c3661e84"

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
