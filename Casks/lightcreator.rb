cask "lightcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.6.1"
  sha256 arm:   "1e19f14b200a197b11124d20eec15817e6d66642bc5285e8f2c0821f00547fbd",
         intel: "310d24d294b73b0e884a20c689cb755980aece8d1cf473a68b4236c53300942a"

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
