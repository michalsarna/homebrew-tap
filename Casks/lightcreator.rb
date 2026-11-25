cask "lightcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.9.10"
  sha256 arm:   "863643822e4815f2b67d566b645b08302476e49695a31da39246709a29d795a2",
         intel: "f669e8815aacab6f4676e4b090ec0adc393ee2dc286ff1ede7c2b5a0d89ac87e"

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
