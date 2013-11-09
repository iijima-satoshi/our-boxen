class people::taka84u9 {
  # 自分の環境で欲しいresourceをincludeする
  include chrome
  include dropbox
  include skype
  include firefox 
  include java
  include iterm2::stable
  include tunnelblick::beta
  include eclipse::jee

  package {
    'XtraFinder':
      source   => "http://www.trankynam.com/xtrafinder/downloads/XtraFinder.dmg",
      provider => pkgdmg;
  }

=begin 
  # homebrewでインストール
  package {
    [
      'tmux',
      'reattach-to-user-namespace',
      'tig',
    ]:
  }

  $home     = "/Users/${::luser}"
  $src      = "${home}/src"
  $dotfiles = "${src}/dotfiles"

  # ~/src/dotfilesにGitHub上のtaka84u9/dotfilesリポジトリを
  # git-cloneする。そのとき~/srcディレクトリがなければいけない。
  repository { $dotfiles:
    source  => "taka84u9/dotfiles",
    require => File[$src]
  }
  # git-cloneしたらインストールする
  exec { "sh ${dotfiles}/install.sh":
    cwd => $dotfiles,
    creates => "${home}/.zshrc",
    require => Repository[$dotfiles],
  }
=end
}
