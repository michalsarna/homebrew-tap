cask "lightcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.9.1"
  sha256 arm:   "4ed48d1962aaef97a89844c165e4bed9ae2cbf56cd47e3e4aa779d59cda6b50b",
         intel: "231792e73a646c4a81eef59dcaa1c50164ccd69dac9f6f2893eeef3f209f3005"

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
