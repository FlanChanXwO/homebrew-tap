class PixivCli < Formula
  desc "Pixiv command-line client and MCP server"
  homepage "https://github.com/FlanChanXwO/pixiv-cli"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.3.0/pixiv-cli_0.3.0_darwin_arm64.tar.gz"
      sha256 "46f5e1a964314c5504a8af3a73c3661f6ac105de1cb473cdc4de471e43cbdb7b"
    else
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.3.0/pixiv-cli_0.3.0_darwin_amd64.tar.gz"
      sha256 "401c73a4af9ef751e6223d642b078313d15e7629f4d9675aaeb840af01820f3e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.3.0/pixiv-cli_0.3.0_linux_arm64.tar.gz"
      sha256 "5a579f3b2764dbb4f650f3fc0b5715df125c4cc8f8647a7d36da66059e655483"
    else
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.3.0/pixiv-cli_0.3.0_linux_amd64.tar.gz"
      sha256 "e8c4e90e3cb789d8acc8c67877a46fae9fd5ab17904525b9258922d00971ae81"
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
