cask "lightcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.6.0"
  sha256 arm:   "abbeb8457e5c05a9643176e35cd886aa8ddcb61646ef0614071515fe814d616e",
         intel: "9c4c542a968991aa7090e2f23ec578febf206d862848b33702d51cef5fac6dd2"

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
