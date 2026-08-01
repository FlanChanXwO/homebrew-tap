class PixivCli < Formula
  desc "Pixiv command-line client and MCP server"
  homepage "https://github.com/FlanChanXwO/pixiv-cli"
  version "0.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.9.0/pixiv-cli_0.9.0_darwin_arm64.tar.gz"
      sha256 "9bec2828c08e6cfbab93c03d68cf2f942c5c1a86bdb509f27a0d1d31b626a355"
    else
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.9.0/pixiv-cli_0.9.0_darwin_amd64.tar.gz"
      sha256 "2c2615fb07b9473ce47e098adb2d746de09dc08077a3b9699dfda9c80816c329"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.9.0/pixiv-cli_0.9.0_linux_arm64.tar.gz"
      sha256 "c0e1d7e143f8ead92fbc7a89038b32453eb1b3a3676abf54262e97aa9c31f16d"
    else
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.9.0/pixiv-cli_0.9.0_linux_amd64.tar.gz"
      sha256 "5f9e4da045831c7adf818e9ce587d352e3725daabd82571178534a3cfba68a6e"
    end
  end

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
