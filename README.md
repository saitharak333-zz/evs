# Land Registary system

Installations -->

Installing Ganache: Emulator

    https://truffleframework.com/ganache
    
Click on Download option.

We will bw downloading a app image, when the download is finished open properties and select on Permissions and tick the box which allows you to run this app image as a program.

When this is finished open it by double clicking on it.

Then a opp up box appears saying "Would you like to integrate ganache with your system" click on yes please.

Accept Analytics

We can we a test network with 10 nodes setup

Install Metamask Extension to chrome and import those 10 accounts in metamask.

Also go line 36 in our ChainList.sol file in contracts folder and update the address value i.e 0x655516B2c088204A08671d2D5E00017020D5290d to your ganache's 1st account number.

If you have installed the previous versions of Nodejs and npm use google help to 1st uninstal that version and then try to install the newer versions specified down here.

    sudo apt-get purge --auto-remove nodejs

Installing Nodejs and npm: Nodejs atleast versiuon 8 and npm atleast version 5

    sudo apt install curl
    curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash -
    sudo apt-get install -y nodejs
    sudo apt-get install gcc g++ make
    curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
    sudo apt-get update && sudo apt-get install yarn
    sudo apt-get install -y build-essential
    
If everything is properly installed, then upon typing 

    node -v
    
We have to observe the node version installed in our system

Type 

    npm -v
    
to get the version number of the npm installed

Now install truffle framework: used for compiling testing and deploying the blockchains,
1st uninstall the orevious versions of truffle

    sudo npm uninstall -g truffle
    
    sudo npm install -g truffle@4.0.4

Be specific on installing truffle version 4.0.4, to check the version use

    truffle version

Running the Dapp -->

Open ganache

Open chainlist directory in terminal,

    npm install
    truffle migrate --compile-all --reset --network ganache
    npm run dev
