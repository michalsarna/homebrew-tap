cask "basecreator" do
  arch arm: "arm64", intel: "x86_64"

  version "1.65.3"
  sha256 arm:   "05bdcc7dc875329c9dadff42e424914efe490c8153ca510810b00d41af7cd634",
         intel: "98b5bc9992a9d4ec218d15a560fd55decda37822802dab7caff24dc93e43d8b5"

  url "https://github.com/michalsarna/baseCreator/releases/download/v#{version}/basecreator-v#{version}-macos-#{arch}.dmg"
  name "BaseCreator"
  desc "Drawing program that writes the project files of the Creator apps"
  homepage "https://github.com/michalsarna/baseCreator"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "BaseCreator.app"

  zap trash: "~/Library/Application Support/baseCreator/apps/basecreator"

  caveats <<~EOS
    BaseCreator is not notarized by Apple yet. If macOS refuses to open it the first time,
    right-click the app in Applications and choose Open, or run:
      xattr -dr com.apple.quarantine "#{appdir}/BaseCreator.app"
  EOS
end
