export sp=/Users/kristi.jorgji/Desktop/test/
export spw=$sp/single_vagrant

function siops() {
    cd $sp/single_devops
}

function siops-vagrant() {
    cd $sp/single_devops
    vguss ansible
}

function sidocker() {
    cd $sp/single_vagrant
    vguss docker
}
