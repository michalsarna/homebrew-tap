cask "lightcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.8.7"
  sha256 arm:   "12a6fca0c3ee3871ce4b7037e173d9cf715eeb2204862f9cce8c240a856a8be6",
         intel: "cd546d1f17363ea80556e25267bf3e55625701b505d2b36e0bd303309bc5d5f2"

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
