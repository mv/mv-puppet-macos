
class brew::install {

    require defaults

    file { '/usr/local':
        ensure  => directory,
        owner   => $defaults::machine_user,
        group   => $defaults::machine_group,
        recurse => true,
    }

    exec { 'brew_install':
        command   => '/usr/bin/ruby -e "$(/usr/bin/curl -fsSL https://raw.github.com/mxcl/homebrew/master/Library/Contributions/install_homebrew.rb)"',
        cwd       => '/usr/local',
        creates   => '/usr/local/bin/brew',
        path      => '/usr/bin:/bin',
        logoutput => on_failure,
        user      => $defaults::machine_user,
        group     => $defaults::machine_group,
        require   => File['/usr/local']
    }

}

