cask "lightcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.5.3"
  sha256 arm:   "e6720a9663ec2f934fac39a7edb8f4eab0869e2d0d4787e551043a92ad7f4200",
         intel: "2fa69fb24891645ce2b5a0a832764016700115aec8b5ab8427b04ef6a3015d12"

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
