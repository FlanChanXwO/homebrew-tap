class PixivCli < Formula
  desc "Pixiv command-line client and MCP server"
  homepage "https://github.com/FlanChanXwO/pixiv-cli"
  version "0.7.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.7.1/pixiv-cli_0.7.1_darwin_arm64.tar.gz"
      sha256 "78bec038227b487953c2f82ea2aeea2d4a445efee719ad96f40135c600afc2e0"
    else
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.7.1/pixiv-cli_0.7.1_darwin_amd64.tar.gz"
      sha256 "cd3b2de42e28e80837c9f898361534405b6275d837f32ccd76978667b8fa120e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.7.1/pixiv-cli_0.7.1_linux_arm64.tar.gz"
      sha256 "edf3c657c3ff85ee6aea13a8af8f59777641ce26176de3cec2ed42fe2d698e32"
    else
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.7.1/pixiv-cli_0.7.1_linux_amd64.tar.gz"
      sha256 "d09f13229068c14e08ede7edd19eec949c02b86eb95c52d5797e22921b6d6d50"
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
