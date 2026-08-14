class JavdbCli < Formula
  desc "Unofficial JavDB app API command-line client"
  homepage "https://github.com/FlanChanXwO/javdb-cli"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.7.0/javdb-cli_0.7.0_darwin_arm64.tar.gz"
      sha256 "9d356a90d6f548ec5e1fad00ab03efbfb7a5292215e4da00d2ec901b4de08aaa"
    else
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.7.0/javdb-cli_0.7.0_darwin_amd64.tar.gz"
      sha256 "7b6a4279e006c9fc731b1c7a4b781d4e07723cbf234711ee9cbfa37711c5a0a1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.7.0/javdb-cli_0.7.0_linux_arm64.tar.gz"
      sha256 "d8e47c5aef0a18d4b021b568d35e13f59c03fc060dca368e6efb062c11c35e86"
    else
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.7.0/javdb-cli_0.7.0_linux_amd64.tar.gz"
      sha256 "62e2bdea7cd3d12254a47a99c2e67a0790d6e9c4cb50dbc8d350a5d9f671fbb5"
    end
  end

  def install
    bin.install "javdb"
  end

  test do
    version_info = JSON.parse(shell_output("#{bin}/javdb version --json"))
    assert_equal "v#{version}", version_info["version"]
  end
end
