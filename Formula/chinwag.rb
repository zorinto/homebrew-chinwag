# chinwag's source is private, so this formula installs the prebuilt Apple silicon binary from the npm package.
class Chinwag < Formula
  desc "Read, reply to and manage WhatsApp Desktop chats from the Mac terminal"
  homepage "https://www.npmjs.com/package/@zorinto/chinwag"
  url "https://registry.npmjs.org/@zorinto/chinwag/-/chinwag-0.3.0.tgz"
  sha256 "1fe8ae5d003586efbb641724bb37b78fd30f417d67a8b668e3b59938b8d3b027"
  license :cannot_represent

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "vendor/chinwag"
    prefix.install "LICENSE"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/chinwag --version")
  end
end
