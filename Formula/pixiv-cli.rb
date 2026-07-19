class PixivCli < Formula
  desc "Pixiv command-line client and MCP server"
  homepage "https://github.com/FlanChanXwO/pixiv-cli"
  version "0.4.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.4.5/pixiv-cli_0.4.5_darwin_arm64.tar.gz"
      sha256 "e82269e9699693ee62c1197ae965b58d5b7eaad9caccc5f133992d6b2d530ddc"
    else
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.4.5/pixiv-cli_0.4.5_darwin_amd64.tar.gz"
      sha256 "97f034382be152c6abde0fd3c5c9d81075fbde89b82c85cdf2c2614c40f457e3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.4.5/pixiv-cli_0.4.5_linux_arm64.tar.gz"
      sha256 "cb02e584536ffd402324c4471b772da5f5ea16ec3dc836c20a36398b83740c74"
    else
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.4.5/pixiv-cli_0.4.5_linux_amd64.tar.gz"
      sha256 "d46601ca89963c98b053fdebf5b0e5f11d1af263faa3e49a97ad7a6c6660ffca"
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
