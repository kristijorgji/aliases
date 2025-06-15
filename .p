export sp=/home/kj/Desktop/test/s
export spw=$sp/single_vagrant

function sibase() {
    cd $sp
}

function siops() {
    cd $sp/single_devops
}

function siops-vagrant() {
    cd $sp/single_devops
    vguss ansible
}

function sidocker() {
    cd $sp/single_vagrant/docker
    docker compose up -d
}

function sidocker-vagrant() {
    cd $sp/single_vagrant
    vguss docker
}
