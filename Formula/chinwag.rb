# chinwag's source is private, so this formula installs the prebuilt Apple silicon binary from the npm package.
class Chinwag < Formula
  desc "Read, reply to and manage WhatsApp Desktop chats from the Mac terminal"
  homepage "https://www.npmjs.com/package/@zorinto/chinwag"
  url "https://registry.npmjs.org/@zorinto/chinwag/-/chinwag-0.4.1.tgz"
  sha256 "fc4de82d9094d91e58c6c51d7b5fe70b3db9b6f8bf6f8722efe94a2172fd36e5"
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
