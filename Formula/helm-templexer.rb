class HelmTemplexer < Formula
  desc "Render Helm charts for multiple environments using explicit configuration"
  homepage "https://github.com/hendrikmaus/helm-templexer"
  url "https://github.com/hendrikmaus/helm-templexer/archive/refs/tags/0.3.0.tar.gz"
  sha256 "aa4c377a6766b15dc6f8f2b86408b06dfacab0505bb83eaff5d1839aed456540"
  license "MIT"
  revision 1

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/hendrikmaus/homebrew-tap/releases/download/helm-templexer-0.2.11_1"
    sha256 cellar: :any_skip_relocation, catalina:     "574a3953c67f7d088657bcba3aeed75ea558c8b960171d497692473cfcc4e70f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "453e80bfd9bdf3e329abbe575e7e49c21c6092cff72dec647964e871363a838e"
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
