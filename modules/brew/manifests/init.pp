
class brew {

    require brew::params
    require pkg::gcc
    require pkg::git

    include brew::install

}

