cask "lightcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.8.3"
  sha256 arm:   "af98e1eb8e6ec968108543e193829d810f6d507ced80b14db7b82b90394f9ca1",
         intel: "62d65e8d81f6c942335fd8446017daaeb7013ba0336ad7a61ff4b28d561a75e9"

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
