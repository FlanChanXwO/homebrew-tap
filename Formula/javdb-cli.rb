class JavdbCli < Formula
  desc "Unofficial JavDB app API command-line client"
  homepage "https://github.com/FlanChanXwO/javdb-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.1.0/javdb-cli_0.1.0_darwin_arm64.tar.gz"
      sha256 "7f68ea9e189e24006cbcf1cc8e6e69bbc3e1abbc72939b55d5a1db4551466745"
    else
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.1.0/javdb-cli_0.1.0_darwin_amd64.tar.gz"
      sha256 "0ca58d669cb47ad4889f7b3ddf63aea0f0239519c5434bc05201988dcc8761de"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.1.0/javdb-cli_0.1.0_linux_arm64.tar.gz"
      sha256 "f41fed7c0917d49decc70d96a0b0b028501bb3b132f3f94fdc0bf2558a623b5e"
    else
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.1.0/javdb-cli_0.1.0_linux_amd64.tar.gz"
      sha256 "ec0c3dde8adb29bab7022b7322928787e87c1e14d050cf8e1eff7fd9e1466885"
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
