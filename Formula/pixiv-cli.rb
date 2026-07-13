class PixivCli < Formula
  desc "Pixiv command-line client and MCP server"
  homepage "https://github.com/FlanChanXwO/pixiv-cli"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.1.1/pixiv-cli_0.1.1_darwin_arm64.tar.gz"
      sha256 "4e970fc55cae0d5aa5f2b92d2ee977037aa9daeed2434f53aa1d4fe8691db38f"
    else
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.1.1/pixiv-cli_0.1.1_darwin_amd64.tar.gz"
      sha256 "6ce235947dbfdf16afa8bbb433776b110457ca1e6a60adc3c803c64a0322470c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.1.1/pixiv-cli_0.1.1_linux_arm64.tar.gz"
      sha256 "73ce333738bb586430a45826f5aa990cf79ee209bb2538f3335e1be4ae01168b"
    else
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.1.1/pixiv-cli_0.1.1_linux_amd64.tar.gz"
      sha256 "632f21577bf349cba6bb0946e2c537f66d761015c72c8334165f19a8f064d789"
    end
  end

  conflicts_with "pixiv-cli-beta", because: "both install the pixiv command"

  def install
    bin.install "pixiv"
  end

  test do
    version_info = JSON.parse(shell_output("#{bin}/pixiv version --json"))
    assert_equal "v#{version}", version_info["version"]
  end
end
