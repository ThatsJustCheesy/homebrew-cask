cask "oversight" do
  version "2.1.2"
  sha256 "784ab7a5fbd04bae8b0e1bccd4f2d6d96444c43a1d67f468638e443a31bff017"

  url "https://github.com/objective-see/OverSight/releases/download/v#{version}/OverSight_#{version}.zip",
      verified: "github.com/objective-see/OverSight"
  name "OverSight"
  desc "Monitors computer mic and webcam"
  homepage "https://objective-see.com/products/oversight.html"

  depends_on macos: ">= :catalina"

  installer script: {
    executable: "#{staged_path}/OverSight Installer.app/Contents/MacOS/OverSight Installer",
    args:       ["-install"],
    sudo:       true,
  }

  uninstall script: {
    executable: "#{staged_path}/OverSight Installer.app/Contents/MacOS/OverSight Installer",
    args:       ["-uninstall"],
    sudo:       true,
  }

  zap trash: [
    "~/Library/Caches/com.objective-see.oversight",
    "~/Library/Caches/com.objective-see.OverSightHelper",
    "~/Library/Preferences/com.objective-see.oversight.plist",
    "~/Library/Preferences/com.objective-see.OverSightHelper.plist",
  ]
end
