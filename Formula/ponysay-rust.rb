class PonysayRust < Formula
  desc "Bare-bones implementation of ponysay in rust"
  homepage "https://github.com/evant/ponysay-rust"
  url "https://github.com/evant/ponysay-rust/archive/v0.1.tar.gz"
  version "0.1"
  sha256 "077e71c1cf7edbdd540c266e4dd514dd4428e892c14609d92a0917b20921e770"
  head "https://github.com/evant/ponysay-rust.git"

  depends_on "rust" => :build

  conflicts_with "ponysay", :because => "it ships the ponysay binary"

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test ponysay-rust`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "cargo test"
  end
end
