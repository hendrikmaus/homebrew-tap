class HelmTemplexer < Formula
  desc "Render Helm charts for multiple environments using explicit configuration"
  homepage "https://github.com/hendrikmaus/helm-templexer"
  url "https://github.com/hendrikmaus/helm-templexer/archive/v0.2.7.tar.gz"
  sha256 "50407bc373f5a6193a7418c6772115769bce4ce15ebe58cc20ba5c9e91b73051"
  license "MIT"
  revision 1

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/hendrikmaus/homebrew-tap/releases/download/helm-templexer-0.2.2_1"
    sha256 cellar: :any_skip_relocation, catalina:     "8add6f02dc559df19e8101a1a672326c6dd47803f19a08bfc09e00d21fe1bfd5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e116aeb4daac888779bef95026d8cfd4ca13261d222dfd7a71805a158844cd6e"
  end

  head do
    url "https://github.com/hendrikmaus/helm-templexer.git"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "helm-templexer", shell_output("#{bin}/helm-templexer help")
  end
end
