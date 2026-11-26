cask "lightcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "1.0.0"
  sha256 arm:   "907cdf2fe28f618ead862fab1cc48d660d64a3a4d9c09197aaef1f609b4daac7",
         intel: "895e7fca9bd487542611c36a5d2d74720641d26ebebe0beed47604e20a32bd59"

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
