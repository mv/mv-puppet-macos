
class brew::all {

    require defaults

    define brew_install( $cmd ){

        $creates = $cmd ? {
            false   => "bin/${name}",
            default => $cmd,
        }

        exec { "brew_${name}":
            command   => "brew install ${name}",
            cwd       => "/usr/local",
            creates   => "/usr/local/${creates}",
            path      => "/usr/local/bin:/usr/bin:/bin",
            logoutput => on_failure,
            user      => "${defaults::machine_user}",
            group     => "${defaults::machine_group}",
        } # exec

    } # define

    ###
    ### brew_install( 'pkg_name' [, 'path/creates' ] )
    ###
    brew_install('coreutils' , 'bin/gls'  )
    brew_install('findutils' , 'bin/gfind')
    brew_install('moreutils' , 'bin/lckdo')
    brew_install('ack')
    brew_install('dos2unix')

    brew_install('bash')
    brew_install('bash-completion','etc/bash_completion')
    brew_install('zsh')

    brew_install('csshx','bin/csshX')
    brew_install('gnupg')
    brew_install('nmap')
    brew_install('ssh-copy-id')
    brew_install('wget')

    brew_install('git')
    brew_install('mercurial','bin/hg')
    brew_install('tig')

    brew_install('gawk')
    brew_install('xmlstartlet','bin/xml')

    brew_install('libiconv','bin/iconv')

    brew_install('readline')
    brew_install('rlwrap')

    brew_install('psgrep')
    brew_install('watch')

    brew_install('figlet')
    brew_install('fortune')

    brew_install('rpm2cpio')
    brew_install('unrar')
    brew_install('xz')

    brew_install('aws-iam-tools'          , 'bin/iam-usercreate')
    brew_install('cloud-watch'            , 'bin/mon-version')
    brew_install('ec2-ami-tools'          , 'bin/ec2-ami-tools-version')
    brew_install('ec2-api-tools'          , 'bin/ec2-ver')
    brew_install('rds-command-line-tools' , 'bin/rds-version')

}

