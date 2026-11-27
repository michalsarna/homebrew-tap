cask "lightcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "1.1.0"
  sha256 arm:   "e6f384d56c14ee943431a9d3efe82feed442e4a35b4fb80e0633d496099456b4",
         intel: "4656922e8bea317c09fa0cabaefbf3e996ec2860132978ee022cc6dd59da0cfd"

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
