class PixivCli < Formula
  desc "Pixiv command-line client and MCP server"
  homepage "https://github.com/FlanChanXwO/pixiv-cli"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.8.0/pixiv-cli_0.8.0_darwin_arm64.tar.gz"
      sha256 "570304ae6b873a41954a675a3f9e537a78657c4742a405b55ade4ac08ea56608"
    else
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.8.0/pixiv-cli_0.8.0_darwin_amd64.tar.gz"
      sha256 "5076c5bb75c922c9ee1e079a4dcaa2ad190fbab4f452e2ba963148d7d19a1907"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.8.0/pixiv-cli_0.8.0_linux_arm64.tar.gz"
      sha256 "bb1b5c63dbd9a5f18a126f12674be6f66c38f2d454113aaf2e26303ee4a462e4"
    else
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.8.0/pixiv-cli_0.8.0_linux_amd64.tar.gz"
      sha256 "70bfdc9a5ff40d393c537c4ffe6758af0354987aa1655645daa176a3e0d1a6b8"
    end
  end

  conflicts_with "pixiv-cli-beta", because: "both install the pixiv command"

  def install
    bin.install "pixiv"
  end

  def post_install
    # The hidden command reports integration failures without invalidating the
    # verified Homebrew installation; a normal browser login retries it.
    system bin/"pixiv", "auth", "_install-handler"
  end

  test do
    version_info = JSON.parse(shell_output("#{bin}/pixiv version --json"))
    assert_equal "v#{version}", version_info["version"]
  end
end
